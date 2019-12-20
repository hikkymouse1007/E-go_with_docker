class UserArticlesController < ApplicationController

	before_action :logged_in_user, only: [:index,:show,:new, ]

  def index
  	 @articles = current_user.user_articles
  end

  def show
  	@current_user = current_user
    @article = UserArticle.find(params[:id])
    @words1 = @article.title.scan(/\w+/).uniq {|word| word.downcase}
    @words2 = @article.content.scan(/\w+/).uniq {|word| word.downcase}
    @words = @words1 + @words2
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
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id
    target = "ja"
    @article.japanese_title = translate.translate @article.title, to: target
    @article.japanese_content = translate.translate @article.content, to: target
 	  if @article.save
      flash[:success] = "Article created!"
      # redirect_to user_path(current_user)
      redirect_to user_article_path(@article)
    else
      flash.now[:danger] = '記入漏れがあります'
      render 'new'
    end
  end

  def edit
    @article = UserArticle.find(params[:id])
  end

  def update
    @article = UserArticle.find(params[:id])
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id
    target = "ja"
    @article.japanese_title = translate.translate @article.title, to: target
    @article.japanese_content = translate.translate @article.content, to: target
    if @article.update(user_article_params)
    #showへ
      redirect_to user_article_path(@article), notice: 'Article updated!'
    else
      render :edit
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
  	params.require(:user_article).permit(:category,:title,:content,:url,:published_at,:japanese_title,:japanese_content)
  end


end