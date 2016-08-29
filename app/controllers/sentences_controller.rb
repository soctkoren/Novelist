class SentencesController < ApplicationController

	def create
		@sentence = Sentence.create()

		respond_to do |format|
			format.js
			format.html
		end		
	end

	private
		def sentence_params
			params.require(:sentence).permit(:sentence, :segment_id, :user_id)
		end
end
