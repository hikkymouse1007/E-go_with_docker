class PublishersController < ApplicationController
  def index
    @category = params[:category]
    @sources = Publisher.where(category: @category).page(params[:page]).per(8)
  end

  def show
    news_api_key = ENV["NEWS_API_KEY_ID"]
    newsapi = News.new(news_api_key)
    @sources = params[:sources]
    @top_headlines = newsapi.get_top_headlines(sources: @sources)
    @today = Date.today
  end
end
