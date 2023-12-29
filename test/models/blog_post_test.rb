require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
#   assert true
  # end

  test "draft? returns true when published_at is nil" do
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false when published_at is not nil" do
    refute blog_posts(:published).draft?
  end

  test "published? returns true when published_at is not nil" do
    assert blog_posts(:published).published?
  end

  test "published? returns false when published_at is nil" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false when published_at is in the future" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true when published_at is in the future" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false when published_at is in the past" do
    refute blog_posts(:published).scheduled?
  end

  test "scheduled? returns false when published_at is nil" do
    refute blog_posts(:draft).scheduled?
  end



end
