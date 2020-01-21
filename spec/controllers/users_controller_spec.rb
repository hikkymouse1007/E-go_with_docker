require 'rails_helper'
require 'webmock/rspec'

RSpec.describe UsersController, type: :controller do

  before do
    WebMock.enable!
  end

  describe "#home" do
    it "正常にレスポンスを返すこと" do
    end
  end

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


