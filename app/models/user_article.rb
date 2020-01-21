class UserArticle < ApplicationRecord
  belongs_to :user
  has_many   :vocabs,           dependent: :destroy
  validates  :user_id,          presence: true
  validates  :title,            presence: true
  validates  :content,          presence: true
  validates  :japanese_title,   presence: true
  validates  :japanese_content, presence: true
  validates  :url,              presence: true
  validates  :published_at,     presence: true
  enum category: { "経済" => 0, "エンターテイメント" => 1, "一般" => 2, "医療" => 3, "科学" => 4, "スポーツ" => 5, "テクノロジー" => 6, "その他" => 7 }
end
