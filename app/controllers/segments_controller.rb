class SegmentsController < ApplicationController

	def create
		@segment = Segment.create(segment_params)
		sentence = Sentence.create(segment_id: @segment.id, user_id: current_user.id, sentence: segment_params[:sen])
		vote = Vote.create(vote_count: 1, user_id: current_user.id, sentence_id: sentence.id)
		puts 'herhehre'
		
		redirect_to :back	
	end

	private
		def segment_params
			params.require(:segment).permit(:winning_sentence, :story_id, :sen)
		end

		# 	def sentence_params
		# 	params.require(:sentence).permit(:sentence, :segment_id, :user_id)
		# end
end
