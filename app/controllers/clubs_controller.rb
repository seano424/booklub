class ClubsController < ApplicationController
  before_action :set_club, only: [ :show, :edit, :update, :destroy ]

  def index
    @clubs = policy_scope(Club)
  end

  def show
  end

  private

  def set_club
    @club = Club.find(params[:id])
    authorize @club
  end
end
