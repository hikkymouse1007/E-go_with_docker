class VocabsController < ApplicationController
	def create
		project_id = ENV["CLOUD_PROJECT_ID"]
		translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id

	 	@english = params[:english]


	 	target = "ja"

		# Translates some text into Russian
		@japanese = translate.translate @english, to: target
	 	#binding.pry
	 	# @vocab = vocab.new(vocab_params)
	 	# binding.pry
	 	@vocab = Vocab.new
	 	@vocab.eng = @english
	 	@vocab.jpn = @japanese

	 	@vocab.save
	 	redirect_to show_path
	end

	def destroy
		vocab = Vocab.find(params[:id])
        vocab.destroy
        redirect_to show_path
	end

		private

    def vocab_params
  	    # params.require(:vocab).permit(:eng)
  	    params.require(:vocab).permit(:english)
    end
end
