class SegmentsController < ApplicationController

	def create
		@segment = Segment.create(segment_params)
		sentence = Sentence.create(segment_id: @segment.id, user_id: current_user.id, sentence: segment_params[:sen])
		# vote = Vote.create(vote_count: 1, user_id: current_user.id, sentence_id: sentence.id)
		
		redirect_to :back	
	end

	def up
		if request.xhr?
			puts "upp"
			puts params.inspect
			puts "this is a json"
			#todo need to figure out how to parse json.

			puts json
			puts "this is a json above"
			# search = params[:search]
			# @photos = Unsplash::Photo.search("#{search}")

			# ids = []
			# @photos.each do |photo|
			# 	ids << photo.id
			# end
			
			# root_url "https://source.unsplash.com/"
			# query
			# hash = {}
			# p @photos[0].methods
			#TODO build the html links here and send it back.
			# render json: @photos
		else
			new_story_path
		end
	end

	def down
		puts "down"
	end
	
	private
		def segment_params
			params.require(:segment).permit(:winning_sentence, :story_id, :sen)
		end

		# 	def sentence_params
		# 	params.require(:sentence).permit(:sentence, :segment_id, :user_id)
		# end
end
