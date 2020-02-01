require 'rails_helper'

RSpec.describe UserArticle, "モデルに関するテスト", type: :model do
   it "有効なファクトリを持つこと" do
     expect(FactoryBot.build(:user_article)).to be_valid
   end

   it "タイトルがなければ投稿できないこと" do
     user_article = FactoryBot.build(:user_article, title: nil)
     user_article.valid?
     expect(user_article.errors).to be_added(:title, :blank)
   end

   it "本文がなければ投稿できないこと" do
     user_article = FactoryBot.build(:user_article, content: nil)
     user_article.valid?
     expect(user_article.errors).to be_added(:content, :blank)
   end

   it "urlがなければ投稿できないこと" do
     user_article = FactoryBot.build(:user_article, url: nil)
     user_article.valid?
     expect(user_article.errors).to be_added(:url, :blank)
   end

   it "ニュースの日付がなければ投稿できないこと" do
     user_article = FactoryBot.build(:user_article, published_at: nil)
     user_article.valid?
     expect(user_article.errors).to be_added(:published_at, :blank)
   end

   it "カテゴリがなければ投稿できないこと" do
     user_article = FactoryBot.build(:user_article, category: nil)
     user_article.valid?
     expect(user_article.errors).to be_added(:category, :blank)
   end
  end
