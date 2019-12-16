class UserArticlesController < ApplicationController

	before_action :logged_in_user, only: [:index,:show,:new, ]

  def index
  	 @articles = current_user.user_articles


  end

  def show
  	@current_user = current_user
    @article = UserArticle.find(params[:id])
    @words = @article.content.scan(/\w+/).uniq {|word| word.downcase}
    @vocabs = @article.vocabs
  end

  def new
    @article = UserArticle.new
    @title = params[:title]
    @published_at = params[:publishedAt]
    @url = params[:url]
  end

  def create
   	@article = UserArticle.new(user_article_params) #bui]d:アソシエーションに紐づくnewメゾット
    @article.user_id = current_user.id

 	  if @article.save
      flash[:success] = "Article created!"
      # redirect_to user_path(current_user)
      redirect_to user_article_path(@article)
    else
      flash.now[:danger] = '記入漏れがあります'
      render 'new'
    end

  end

  def destroy
    article = UserArticle.find(params[:id])
    article.destroy
    flash[:success] = "Article deleted."
    redirect_to user_path(current_user)
  end

  	private

  def user_article_params
  	params.require(:user_article).permit(:category_id,:title,:content,:url,:published_at)
  end


end