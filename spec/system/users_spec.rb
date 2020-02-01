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
       stub_request(:get, "https://newsapi.org/v2/sources?apiKey=#{ENV["NEWS_API_KEY_ID"]}&language=en").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'newsapi.org',
        'User-Agent'=>'Ruby'
        }).to_return(
             status: 200,
             body: "success",
             headers: {}
           )
      uri1 = URI.parse("https://newsapi.org/v2/sources?language=en&apiKey=#{ENV["NEWS_API_KEY_ID"]}")
      expect(page).to have_content "E-go!"
      end

      it "サクセスメッセージが表示されていること" do
        expect(page).to have_content "Welcome to E-go!!"
      end
    end
  end
end