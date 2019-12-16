  class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:show,:destroy]
  before_action :correct_user,   only: [:edit, :update,:show,:destroy]

  def home
    news_api_key = ENV["NEWS_API_KEY_ID"]
    newsapi = News.new("#{news_api_key}")
    @top_headlines = newsapi.get_top_headlines(sources: 'bbc-news,the-verge')
    @sources = newsapi.get_sources(language: 'en',country: 'us')
    @all_articles = newsapi.get_everything(
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      # from: '2017-12-01',
                                      # to: '2017-12-12',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 1)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Hello #{@user.name}! Welcome to E-go!!"
      redirect_back_or root_path
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
    @articles = current_user.user_articles
    vocab_ary = []
    vocab_ary_eng = []
    @articles.each do |article|
      article.vocabs.each do |vocab|
        unless vocab_ary_eng.include?(vocab.english)
          vocab_ary << vocab
            vocab_ary_eng << vocab.english
          end
        end
      end
    @vocabs = vocab_ary.sort_by{ |v| v[:english].downcase }
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "See ya later! Hope you come back here!!"
    redirect_to root_url
  end



    private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end


  def set_feed
    # @feed = Feed.find(params[:id])
    @feed1 = Feed.find(1)
  end
end
