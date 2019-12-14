class Word < ApplicationRecord
	belongs_to :user_article, dependent: :destroy
end
