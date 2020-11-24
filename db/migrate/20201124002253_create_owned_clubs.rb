class CreateOwnedClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_clubs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
