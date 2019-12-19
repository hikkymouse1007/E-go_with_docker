class UserArticle < ApplicationRecord
	belongs_to :user
	has_many   :vocabs,dependent: :destroy
	validates  :user_id,     presence: true
	validates  :category, presence: true
	validates  :content, 	 presence: true
	validates  :url, 	 presence: true
	validates  :published_at, 	 presence: true
	extend Enumerize

	enum category: {"---" => 0, Business:1, Entertainment:2, General:3, Health:4, Science:5, Sports:6, Technology:7, Other:8}

end