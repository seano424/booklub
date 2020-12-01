class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.references :club, null: false, foreign_key: true
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token

      t.timestamps
    end
  end
end
