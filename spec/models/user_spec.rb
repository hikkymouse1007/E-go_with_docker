require 'rails_helper'

describe User do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効なアカウントであること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors).to be_added(:name, :blank)
  end

  it "メールアドレスがなければ無効なアカウントであること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors).to be_added(:email, :blank)
  end

  it "重複したメールアドレスではアカウントが作れないこと" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors).to be_added(:email, :taken, value: "aaron@example.com")
  end

  it "パスワードがなければ無効なアカウントであること" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors).to be_added(:password, :blank)
  end

  it "パスワードの再入力がパスワードに一致していなければ無効であること" do
    user = FactoryBot.build(:user, password_confirmation: "fooobar")
    user.valid?
    expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "Password")

  end

  it '名前が50文字を越えるなら無効であること' do
      user = FactoryBot.build(:user, name: "a"*51)
      user.valid?
      expect(user.errors).to be_added(:name, :too_long, count: 50)
  end

  it 'パスワードが6文字未満なら無効であること' do
      user = FactoryBot.build(:user, password: "a"*5)
      user.valid?
      expect(user.errors).to be_added(:password, :too_short, count: 6)
  end

  it 'パスワードが暗号化されているか' do
    user = FactoryBot.create(:user)
    expect(user.password_digest).to_not eq 'foobar'
  end

end

