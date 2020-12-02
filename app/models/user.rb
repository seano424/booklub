class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  has_many :club_memberships, dependent: :destroy
  has_many :clubs, through: :club_memberships

  has_many :created_clubs, class_name: "Club"

  has_many :room_messages
  has_one_attached :profile_photo

  has_many :invitations, class_name: "Invite", foreign_key: "recipient_id"
  has_many :sent_invites, class_name: "Invite", foreign_key: 'sender_id'
end
