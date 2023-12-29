class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current ) }
  scope :scheduled, -> { where("published_at > ?", Time.current)}
  scope :sorted, -> { order(Arel.sql("CASE WHEN published_at IS NULL THEN 1 ELSE 0 END, published_at DESC, updated_at DESC")) }

  def draft?
    published_at.nil?
  end

  def published?
    !draft? && !scheduled?
  end

  def scheduled?
    !draft? && published_at > Time.current
  end
end
