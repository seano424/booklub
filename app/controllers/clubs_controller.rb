class ClubsController < ApplicationController
  before_action :set_club, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # after_action :verify_authorized, only: [ :index ]
  require 'nokogiri'
  require 'open-uri'

  def index
    if params[:query].present?
      @clubs = Club.search_by_name_and_description(params[:query])
    else
      @clubs = Club.all
    end
  end

  def show
    @club_membership = ClubMembership.new
  end

  private

  def set_club
    @club = Club.find(params[:id])
    authorize @club
  end
end
