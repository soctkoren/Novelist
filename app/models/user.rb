class User < ApplicationRecord
	# has_many :likes
	has_many :stories
	# has_many :votes
	has_many :sentences

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
