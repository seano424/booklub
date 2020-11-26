class Book < ApplicationRecord
  has_many :clubs
  include PgSearch::Model
  pg_search_scope :search_by_title_author_syllabus,
    against: [:title, :author, :syllabus],
    associated_against: {
      club: [:name, :description]
    },
    using: {
      tsearch: { prefix: true }
    }
end
