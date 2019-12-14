class UserArticle < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :words
	validates :user_id, presence: true
end
