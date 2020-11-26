class AddPrivateToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :private, :boolean, default: false
  end
end
