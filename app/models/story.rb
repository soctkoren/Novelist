class Story < ApplicationRecord
	has_many :likes
	has_many :segments
	
	belongs_to :user

	def segment_ended?
		#TODO double check if this works
		Time.now - self.created_at 
	
	end

end
