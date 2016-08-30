class AddReference < ActiveRecord::Migration[5.0]
  def change
  	#story
    add_reference :stories, :user

    #likes
    # add_reference :likes, :story
    # add_reference :likes, :user

    #sentence
    add_reference :sentences, :segment
    add_reference :sentences, :user

    #segment
    add_reference :segments, :story
    
    #votes
    # add_reference :votes, :sentence
    # add_reference :votes, :user
  end
end
