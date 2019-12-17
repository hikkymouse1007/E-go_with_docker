class PublishersController < ApplicationController
	def index
		news_api_key = ENV["NEWS_API_KEY_ID"]
    	newsapi = News.new("#{news_api_key}")
    	@category = params[:category]
   	    @sources = newsapi.get_sources(language: 'en',country: 'us',category: @category)


	end

	def show
	    news_api_key = ENV["NEWS_API_KEY_ID"]
	    newsapi = News.new("#{news_api_key}")
	    @name = params[:name]
	    @top_headlines = newsapi.get_top_headlines(sources: @name)
	end
end
