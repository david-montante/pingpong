class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :opponent_id
      t.string :date_played
      t.string :score
      t.string :opponent_score
      
      t.timestamps
    end
  end
end
