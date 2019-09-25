class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader        # Micropostモデルに画像を追加する
  validates :user_id, presence: true              #マイクロポストのuser_idに対する検証
  validates :content, presence: true, length: { maximum: 140 } # Micropostモデルのバリデーション
  validate  :picture_size


  #######
  private
  #######

  # アップロードされた画像の左図をバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
