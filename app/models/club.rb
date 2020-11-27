class Club < ApplicationRecord
  after_create :create_room

  belongs_to :user
  has_many :club_memberships, dependent: :destroy
  has_many :users, through: :club_memberships
  has_many :club_books, dependent: :destroy
  has_many :books, through: :club_books

  has_many :rooms, dependent: :destroy
  has_many :room_messages, through: :rooms

  def create_room
    Room.create(name: self.name, club_id: self.id)
  end

  validates :name, presence: true, uniqueness: true
  has_one_attached :cover_photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description, :language],
    using: {
      tsearch: { prefix: true }
    }
end
