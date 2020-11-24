class AddAdminToClubMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :club_memberships, :admin, :boolean, default: false
  end
end
