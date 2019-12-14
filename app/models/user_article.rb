class UserArticle < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :vocabs
	validates :user_id, presence: true
end
