require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "Google Cloud Translate Api", type: :request do

  before do
    WebMock.enable!
  end

  describe "GET /news_apis" do
    it "APIからのレスポンスを受け取ること" do
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
      p Net::HTTP.get(uri1)
    end
  end
end
