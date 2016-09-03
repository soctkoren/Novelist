class Segment < ApplicationRecord
	belongs_to :story
	has_one :sentence


	attr_accessor :sen
end
