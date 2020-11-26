class Club < ApplicationRecord
  after_create :create_room

  belongs_to :book
  belongs_to :user
  has_many :club_memberships
  has_many :users, through: :club_memberships
  has_many :rooms

  validates :name, presence: true, uniqueness: true

  def create_room
    Room.create(name: self.name, club_id: self.id)
  end
end
