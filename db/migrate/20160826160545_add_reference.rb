class AddReference < ActiveRecord::Migration[5.0]
  def change
  	#likes, stories, votes, sentences belongs to users
  	add_reference :likes, :user
  	add_reference :stories, :user
  	add_reference :votes, :user
  	add_reference :sentences, :user

  	#likes, segments belongs to stories
  	add_reference :likes, :story
  	add_reference :segments, :story

  	#segments, votes belongs to sentences
  	add_reference :sentences, :segment
  	add_reference :sentences, :vote
  end
end
