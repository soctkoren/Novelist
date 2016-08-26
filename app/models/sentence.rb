class Sentence < ApplicationRecord
	has_one :vote
	belongs_to :user
	belongs_to :segment
end
