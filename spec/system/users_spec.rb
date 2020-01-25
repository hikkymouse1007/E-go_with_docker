require "rails_helper"

RSpec.describe User, type: :system do
  include LoginSupport

  let(:login_user) { create(:user, email: "test@mail.com") }
  let(:invalid_user) { create(:user, email: "test_fail@mail.com") }

  describe "ユーザ登録" do
    before do
      WebMock.disable!
      sign_up
    end

    context "ユーザ登録に成功したとき" do
      it "トップページに遷移すること" do
        expect(page).to have_content "E-go!"
      end

      it "サクセスメッセージが表示されていること" do
        expect(page).to have_content "Welcome to E-go!!"
      end
    end
  end
end