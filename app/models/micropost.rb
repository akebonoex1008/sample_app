class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true #マイクロポストのuser_idに対する検証
  validates :content, presence: true, length: { maximum: 140 } # Micropostモデルのバリデーション
end
