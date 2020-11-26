class ClubMembershipsController < ApplicationController
  def new
    @club_membership = ClubMembership.new
  end

  def create
    @club = Club.find(params[:club_id])
    @user = current_user
    @club_membership = ClubMembership.new(user: @user, club: @club)
    if @club_membership.save
      flash[:success] = "Welcome to #{@club.name}! 🎉"
      redirect_to @club   
    end
    
  end
end
