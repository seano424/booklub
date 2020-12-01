class ClubBooksController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @club_book = ClubBook.new
  end

  def create
    @club_book = ClubBook.new(club_books_params)
    @club_book.book = Book.find(params[:book_id])
    @previous_book = ClubBook.where(club_id: @club_book.club, current_book: true).first
    @previous_book.update(current_book: false) unless @previous_book.nil?
    @club_book.read_book = false
    @club_book.current_book = true
    if @club_book.save
      flash[:success] = "The book has been saved to your club!"
      redirect_to @club_book.club
    else
      render :new
    end
  end

  def update
    @club_book = ClubBook.find(params[:id])
    @club_book.update(club_books_params)
    redirect_to @club_book.club
  end

  def club_books_params
    params.require(:club_book).permit(:club_id, :read_book, :current_book)
  end
end
