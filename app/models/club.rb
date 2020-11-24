class Club < ApplicationRecord
  belongs_to :book
  has_many :club_memberships
  has_many :users, through: :club_memberships
  has_one :owned_club
  has_one :owner, through: :owned_club, class_name: "User"

  validates :name, presence:true, uniqueness: true
end
