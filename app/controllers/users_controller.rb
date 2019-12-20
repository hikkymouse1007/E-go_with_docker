  class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:show,:destroy]
  before_action :correct_user,   only: [:edit, :update,:show,:destroy]

  def home
    @today = Date.today
    news_api_key = ENV["NEWS_API_KEY_ID"]
    newsapi = News.new("#{news_api_key}")
    all_articles = newsapi.get_everything(sources: 'bbc-news',language: 'en',page: 2)
    @all_articles = Kaminari.paginate_array(all_articles).page(params[:page]).per(8)
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
    @articles = current_user.user_articles.page(params[:page]).per(5).order(created_at: :desc)
  end

  def category
    @category = params[:category]
    @articles = current_user.user_articles.where(category:@category).page(params[:page]).per(5).order(created_at: :desc)
  end


  def words
    @capitals1 = ("A".."U").to_a
    @capitals2 = ("V".."Z").to_a
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
    vocabs = vocab_ary.sort_by{ |vocab| vocab[:english].downcase }

    if params[:capital].present?
      vocabs_capital = vocabs.select {|vocab| vocab[:english][0].include?(params[:capital])}
      @vocabs = Kaminari.paginate_array(vocabs_capital).page(params[:page]).per(20)
    else
      @vocabs = Kaminari.paginate_array(vocabs).page(params[:page]).per(20)
    end
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

end
