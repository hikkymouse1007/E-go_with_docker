FactoryBot.define do
  factory :vocab do
    association :user_article
    english "test"
    japanese "テスト"
  end
end