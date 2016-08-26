class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
    	t.integer :vote_count
    
      t.timestamps
    end
  end
end
