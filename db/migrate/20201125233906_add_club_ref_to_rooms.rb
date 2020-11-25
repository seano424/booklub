class AddClubRefToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :club, null: false, foreign_key: true
  end
end
