FactoryBot.define do
  factory :user_article do
    association :user
    category 1
    title "Test Title"
    content "This is a test content."
    japanese_title "テストタイトル"
    japanese_content "これはテストコンテンツです。"
    url 'https://www.coindesk.com/bitcoin-mining-power-hits-fresh-all-time-high'
    published_at "2020/01/01"
  end
end
