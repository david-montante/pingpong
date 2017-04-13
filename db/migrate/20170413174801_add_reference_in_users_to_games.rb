class AddReferenceInUsersToGames < ActiveRecord::Migration
  def change
    add_reference :users, :games, index: true
  end
end
