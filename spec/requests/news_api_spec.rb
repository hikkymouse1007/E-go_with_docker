require 'rails_helper'

RSpec.describe "News Api", type: :request do

  before do
    @news_api_key = ENV["NEWS_API_KEY_ID"]
  end

    describe "GET /news_apis" do
      it "works! (now write some real specs)" do
      puts "the key is #{@news_api_key}"
      # get root_path, { "HTTP_AUTHORIZATION"=>"Token token=\"#{@news_api_key}\"" }
      expect(response).to have_http_status(201)
    end
  end
end
