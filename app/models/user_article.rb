class UserArticle < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many   :vocabs,dependent: :destroy
	validates  :user_id,     presence: true
	validates  :category_id, presence: true
	validates  :content, 	 presence: true
	validates  :url, 	 presence: true
	validates  :published_at, 	 presence: true
end