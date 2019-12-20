class VocabsController < ApplicationController
	def create
		unless Vocab.find_by(user_article_id:params[:user_article_id], english: params[:english])
			project_id = ENV["CLOUD_PROJECT_ID"]
			translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id

		 	@english = params[:english]


		 	target = "ja"

			# Translates some text into Russian
			@japanese = translate.translate @english, to: target
		 	# @vocab = vocab.new(vocab_params)
		 	# binding.pry
		 	@vocab = Vocab.new
		 	# @vocab.english = @english
		 	@vocab.japanese = @japanese
		 	@vocab.english = @english
		 	@vocab.user_article_id = params[:user_article_id]
	 	    @vocab.save
	 	    @current_user = current_user
		    ###ここで@vocabsがないとmissing errorが出る
		    # @article = UserArticle.find(params[:id])
		    #  	    binding.pry
		    # @vocabs = @article.vocabs


	 	else
	 	  	flash[:success] = "登録済の単語です"
	 	    redirect_to user_article_path(params[:user_article_id])
	 	end
	end

	def destroy
		vocab = Vocab.find(params[:id])
        vocab.destroy
	end
end
