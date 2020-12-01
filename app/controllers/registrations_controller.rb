class RegistrationsController < Devise::RegistrationsController
  def new
    @token = params[:invite_token]
    build_resource
  end

  def create
    @new_user = build_resource(user_params)
    @token = params.dig("user", "invite_token")
    @new_user.save
    if @token != nil
      club = Invite.find_by_token(@token).club
      new_club_member = ClubMembership.create(club: club, user: @new_user)
      # new_club_member.send_new_member_notification
    end
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        if @token.nil?
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          redirect_to club_path(club)
          flash[:success] = "Congratulations!🎉 You're now a member of #{club.name}"
        end 
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    super
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :address, :email, :password, :profile_photo)
  end
end
