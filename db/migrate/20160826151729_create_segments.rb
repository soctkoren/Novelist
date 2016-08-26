class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
    	t.boolean :winning_sentence, default: false
      t.timestamps
    end
  end
end
