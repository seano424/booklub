class ClubMembership < ApplicationRecord
  belongs_to :user
  belongs_to :club, dependent: :destroy
end
