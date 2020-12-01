class ClubMembership < ApplicationRecord
  belongs_to :user
  belongs_to :club

  # after_create :send_new_member_notification

  def send_new_member_notification
    # call ClubMembershipMailer
    # create a notice for the club owner saying the user has signed up
    # send an email to the owner @new_user has signed up to club
  end
end
