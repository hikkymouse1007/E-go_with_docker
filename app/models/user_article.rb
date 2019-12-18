class UserArticle < ApplicationRecord
	belongs_to :user
	has_many   :vocabs,dependent: :destroy
	validates  :user_id,     presence: true
	validates  :category, presence: true
	validates  :content, 	 presence: true
	validates  :url, 	 presence: true
	validates  :published_at, 	 presence: true
end