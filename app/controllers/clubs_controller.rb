class ClubsController < ApplicationController
  before_action :set_club, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # after_action :verify_authorized, only: [ :index ]
  require 'nokogiri'
  require 'open-uri'

  def index
    if params[:query].present?
      @clubs = Club.search_by_name_and_description(params[:query]).where(private: false)
    else
      @clubs = Club.where(private: false)
    end
  end

  def show
    @club_membership = ClubMembership.find_by(user: current_user, club: @club)
    @club_membership = ClubMembership.new if @club_membership.nil?
    @current_book = @club.club_books.find_by(current_book: true).book unless @club.club_books.empty?
  end

  def destroy
    @club.destroy
    redirect_to root_path
    flash[:alert] = "Your club #{@club.name} has been deleted"
  end

  def new
    @club = Club.new
    authorize @club
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    # @club.club_memberships.admin = true
    authorize @club
    if @club.save
      flash[:success] = "Your club is ready!📚🤓"
      redirect_to club_path(@club)
    else
      flash[:alert] = "Oops! 🙃 Something went wrong there. Try again."
      render :new
    end
  end

  def new
    @club = Club.new
    authorize @club
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    authorize @club
    if @club.save
      flash[:success] = "Your club is ready!📚🤓"
      redirect_to club_path(@club)
    else
      flash[:alert] = "Oops. 🙃 Something went wrong there. Try again."
      render :new
    end
  end

  private

  def set_club
    @club = Club.find(params[:id])
    authorize @club
  end

  def club_params
    params.require(:club).permit(:name, :description, :language, :cover_photo, :private)
  end
end
