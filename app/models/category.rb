class Category < ApplicationRecord
	has_many :user_articles #コンソールでarticleを生成するためには先にcreateする必要がある、本番はseedで
end
