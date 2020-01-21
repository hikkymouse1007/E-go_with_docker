require 'rails_helper'

  # skip_before_action :logged_in_user
  # skip_before_action :correct_user

RSpec.describe UsersController, type: :controller do

  # describe "#home" do
  # it "正常にレスポンスを返すこと" do
  #     get :home
  #     expect(response).to be_success
  #   end
  # end

  describe "#new" do
    it "正常にレスポンスを返すこと" do
      get :new
       expect(response).to be_success
    end
  end

  describe "#new" do
    it "200レスポンスを返すこと" do
      get :new
       expect(response).to have_http_status "200"
    end
  end
end


