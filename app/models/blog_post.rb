class BlogPost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current ) }
  scope :scheduled, -> { where("published_at > ?", Time.current)}
  scope :sorted, -> { order(Arel.sql("CASE WHEN published_at IS NULL THEN 1 ELSE 0 END, updated_at DESC, published_at DESC")) }
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
