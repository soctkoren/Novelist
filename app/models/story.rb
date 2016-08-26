class Story < ApplicationRecord
	has_many :likes
	has_many :segments

	belongs_to :user
end
