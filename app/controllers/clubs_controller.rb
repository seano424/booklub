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
    @club_membership = ClubMembership.find_by(user: current_user, club: @club)
    @club_membership = ClubMembership.new if @club_membership.nil?
    @current_book = @club.club_books.find_by(current_book: true).book
  end

  private

  def set_club
    @club = Club.find(params[:id])
    authorize @club
  end
  def club_params
    params.require(:club).permit[:name, :description, :language, :cover_photo]
  end
end
