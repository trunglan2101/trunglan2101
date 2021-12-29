class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :image,
                    content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: "must be valid image format" },
                    size:
                                  { less_than: 2.megabytes,
                                    message: "should be less than 2MB" }

  self.per_page = 7

  def display_image
    image.variant(resize_to_limit: [300, 500])
  end
end
