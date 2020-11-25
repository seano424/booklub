class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy,
           inverse_of: :room
  belongs_to :club
end
