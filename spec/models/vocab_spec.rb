require 'rails_helper'

RSpec.describe Vocab, "モデルに関するテスト", type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:vocab)).to be_valid
  end

  it "英語がなければ翻訳されないこと" do
    user = FactoryBot.build(:vocab, english: nil)
    user.valid?
    expect(user.errors).to be_added(:english, :blank)
  end

  it "日本語がなければ登録されないこと" do
    user = FactoryBot.build(:vocab, japanese: nil)
    user.valid?
    expect(user.errors).to be_added(:japanese, :blank)
  end
end