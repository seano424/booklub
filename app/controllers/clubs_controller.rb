class ClubsController < ApplicationController
  before_action :set_club, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @clubs = policy_scope(Club)
  end

  def show
    # @room = Room.find(params[:club_id])
  end

  private

  def set_club
    @club = Club.find(params[:id])
    authorize @club
  end
end
