class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.club = Club.find(params[:club_id])
    @invite.sender_id = current_user.id
    if @invite.save
      # InviteMailer.new_user_invite(@invite, new_user_registration_url(invite_token: @invite.token)).deliver
      redirect_to @invite.club
      flash[:success] = "Your invite was successfully sent out! 💌"
    else
      redirect_to @invite.club
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :token)
  end
end
