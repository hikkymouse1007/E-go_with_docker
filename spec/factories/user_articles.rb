FactoryBot.define do
  factory :user_article do
  	association :user
    category "Business"
    title "Test Title"
    content "This is a test content."
    japanese_title "テストタイトル"
    japanese_content "これはテストコンテンツです。"
    url
    published_at
  end
end
