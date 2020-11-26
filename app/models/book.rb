class Book < ApplicationRecord
  has_many :club_books
  has_many :clubs, through: :club_books
  # include PgSearch::Model
  # pg_search_scope :search_by_title_author_syllabus,
  #   against: [:title, :author, :syllabus],
  #   associated_against: {
  #     club: [:name, :description, :language]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
