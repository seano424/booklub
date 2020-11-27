class BooksController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def index
    if params[:query]
      @books = BookApiFetcher.execute(params[:query])
    else
      @books = Book.all
    end
  end

  def show
    @book = BookIdApiFetcher.execute(params[:id])
  end

  def external
    @external_book = BookIdApiFetcher.execute(params[:external_id])
    @book = Book.new
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to new_book_club_book_path(@book)
    else
      render :external
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :syllabus, :author, :image_url)
  end

end
