require 'rails_helper'

RSpec.describe Vocab, "モデルに関するテスト", type: :model do
   it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:vocab)).to be_valid
  end
end
