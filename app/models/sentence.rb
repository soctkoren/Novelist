class Sentence < ApplicationRecord
	# has_one :vote
	acts_as_votable
	
	belongs_to :user
	belongs_to :segment
end
