class AddLanguageToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :language, :string
  end
end
