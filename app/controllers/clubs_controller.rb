class ClubsController < ApplicationController
  before_action :set_club, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :new, :show ]
  # after_action :verify_authorized, only: [ :index ]

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
   params.require(:club).permit(:name, :description, :language, :book_id, :cover_photo)
  end
end
