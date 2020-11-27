class CreateClubBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :club_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.boolean :read_book
      t.boolean :current_book

      t.timestamps
    end
  end
end
