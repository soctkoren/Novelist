class Sentence < ApplicationRecord
	# has_one :vote
	acts_as_votable
	
	belongs_to :user
	belongs_to :segment

	def get_vote_count
		self.get_likes.size - self.get_dislikes.size
	end

end
