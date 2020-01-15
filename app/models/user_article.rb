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
  validates  :category,         presence: true
  enum category: { "---" => 0, "経済" => 1, "エンターテイメント" => 2, "一般" => 3, "医療" => 4, "科学" => 5, "スポーツ" => 6, "テクノロジー" => 7, "その他" => 8 }
end
