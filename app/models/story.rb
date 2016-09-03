class Story < ApplicationRecord
	# has_many :likes
	has_many :segments
	belongs_to :user
	acts_as_votable

	attr_accessor :sentence

	def segment_ended?
		#TODO double check if this works
		Time.now - self.created_at 
	end

	def sort_seg
		puts "yo"
	end

	def grab_all_active_segments(last_winning_seg)

	end

	def move_segment_head
		#find all segments where time is greater than the last updated time of the last winning segment
	end

end
