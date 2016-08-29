class SegementsController < ApplicationController
	def create
		@segment = Segment.create(segment_params)
	end

	private
		def segment_params
			params.require(:winning_sentence, :story_id)
		end
end
