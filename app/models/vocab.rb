class Vocab < ApplicationRecord
  belongs_to :user_article
  validates  :english,         presence: true
  validates  :japanese,         presence: true
end