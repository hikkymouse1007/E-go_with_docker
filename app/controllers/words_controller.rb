class WordsController < ApplicationController
	def create
		project_id = ENV["CLOUD_PROJECT_ID"]
		translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id

	 	@english = params[:english]


	 	target = "ja"

		# Translates some text into Russian
		@japanese = translate.translate @english, to: target
	 	#binding.pry
	 	# @word = Word.new(word_params)
	 	# binding.pry
	 	@vocab = Word.new
	 	@vocab.eng = @english
	 	@vocab.jpn = @japanese

	 	@vocab.save
	 	redirect_to show_path
	end

	def destroy
		vocab = Word.find(params[:id])
        vocab.destroy
        redirect_to show_path
	end

		private

    def word_params
  	    # params.require(:word).permit(:eng)
  	    params.require(:word).permit(:english,)
    end
end
