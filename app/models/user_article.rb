class UserArticle < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :vocabs,dependent: :destroy
	validates :user_id, presence: true
end
