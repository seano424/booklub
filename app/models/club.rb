class Club < ApplicationRecord
  after_create :create_room

  belongs_to :book
  belongs_to :user
  has_many :club_memberships
  has_many :users, through: :club_memberships

  has_many :rooms

  def create_room
    Room.create(name: self.name, club_id: self.id)
  end

  validates :name, presence: true, uniqueness: true
  has_one_attached :cover_photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    associated_against: {
      book: [:title, :author, :syllabus]
  },
  using: {
    tsearch: { prefix: true }
  }
end
