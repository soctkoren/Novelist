class Segment < ApplicationRecord
	belongs_to :story
	has_one :sentence


	def sort_seg

		# self.map {|a,b| a.get_vote_count <=> b.get_vote_count}
	end
	
	attr_accessor :sen
end
