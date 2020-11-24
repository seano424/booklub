class Club < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :club_memberships
  has_many :users, through: :club_memberships

  validates :name, presence: true, uniqueness: true
end
