class Restaurant < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 140 }
  validate  :picture_size

  def feed_comment(restaurant_id)
    Comment.where("restaurant_id = ?", restaurant_id)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "：5MBより大きい画像はアップロードできません。")
      end
    end
end
