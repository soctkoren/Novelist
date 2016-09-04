class Story < ApplicationRecord
	# has_many :likes
	has_many :segments
	belongs_to :user
	acts_as_votable

	attr_accessor :sentence

	def segment_ended(last_seg_time)
		#TODO double check if this works
		Time.now - last_seg_time 
	end

	def get_last_seg
		self.segments.last
	end

	def grab_all_active_segments(last_winning_seg)

	end

	def move_segment_head
		#find all segments where time is greater than the last updated time of the last winning segment
	end
end
