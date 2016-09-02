class SegmentsController < ApplicationController

	def create
		@segment = Segment.create(segment_params)
		sentence = Sentence.create(segment_id: @segment.id, user_id: current_user.id, sentence: segment_params[:sen])
		# vote = Vote.create(vote_count: 1, user_id: current_user.id, sentence_id: sentence.id)
		
		redirect_to :back	
	end

	def up
		if request.xhr?
			seg_id = params[:id]
			story_id = params[:story_id]

			current_story = Story.find(story_id)
			seg = Segment.find(seg_id)
			sentence = seg.sentence

			sentence.liked_by current_user
			puts sentence.votes_for.size
			tally = sentence.get_likes.size - sentence.get_dislikes.size
			render :json => sentence
		else
			# TODO need to catch and rescue
		end
	end

	def down
		if request.xhr?
			seg_id = params[:id]
			story_id = params[:story_id]

			current_story = Story.find(story_id)
			seg = Segment.find(seg_id)
			sentence = seg.sentence
		
			sentence.disliked_by current_user
			tally = sentence.get_likes.size - sentence.get_dislikes.size
			render :json => sentence
		end
	end
	
	private
		def segment_params
			params.require(:segment).permit(:winning_sentence, :story_id, :sen)
		end

		# 	def sentence_params
		# 	params.require(:sentence).permit(:sentence, :segment_id, :user_id)
		# end
end
