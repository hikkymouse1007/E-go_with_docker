require 'rails_helper'

RSpec.describe UserArticle, type: :model do
  it "generates associated data from a factory" do
    note = FactoryBot.create(:user_article)
    puts "This user_article's user is #{user_article.user.inspect}"
  end
end
