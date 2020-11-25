class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence:true

  has_many :club_memberships, dependent: :destroy
  has_many :clubs, through: :club_memberships

  has_many :created_clubs, class_name: "Club"

  has_many :messages
  has_many :reviews
end
