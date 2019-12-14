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
   	@article = UserArticle.new(user_article_params) #bui]d:アソシエーションに紐づくnewメゾット
    @article.user_id = current_user.id
    binding.pry
 	  if @article.save
      flash[:success] = "Article created!"
      redirect_to new_user_article(current_user)
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