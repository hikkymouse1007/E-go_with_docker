class UserArticlesController < ApplicationController

	before_action :logged_in_user, only: [:index,:show,:new, ]

  def index
  	 @articles = current_user.user_articles


  end

  def show
  	@current_user = current_user

  end
  def new

  end

  def create
 	@article = current_user.user_articles.new(user_article_params) #bui]d:アソシエーションに紐づくnewメゾット
 	  if @article.save
      flash[:success] = "Article created!"
      redirect_to new_user_article(current_user)
    end
  end

  	private

  def user_article_params
  	params.require(:user_article).permit(:category_id,:title,:content,:url,:published_at)
  end

  def destroy
    article = UserArticle.find(params[:id])
    article.destroy
    flash[:success] = "Article deleted."
    redirect_to user_articles_path
  end
end