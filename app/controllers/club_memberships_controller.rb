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

  def update
    @club = Club.find(params[:club_id])
    @club_membership = ClubMembership.find(params[:id])
    @club_membership.update(club_membership_params)
  end

  def destroy
    @club_membership = ClubMembership.find(params[:id])
    @club = @club_membership.club
    @club_membership.destroy
    flash[:alert] = "So sorry to see you go 😞"
    redirect_to club_path(@club)
  end

  private

  def club_membership_params
    params.require(:club_membership).permit(:admin)
  end
end
