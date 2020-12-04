class BooksController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def index
    @club = Club.find(params[:club_id])
    if params[:query]
      @books = BooksApiFetcher.execute(params[:query])
    end
  end

  def show
    @book = Book.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def external
    @club = Club.find(params[:club_id])
    @external_book = BookApiFetcher.execute(params[:external_id])
    @book = Book.new
  end

  def new
  end

  def create
    @club = Club.find(params[:club_id])
    @book = Book.new(book_params)
    @categories = params.dig(:book, :categories).split(", ").uniq
    @existing_book = Book.find_by(title: params.dig("book", "title"))
    if @existing_book
      if @club.find_current_book != "No book"
        ClubBook.create(club: @club, book: @existing_book, read_book: false, current_book: false)
      else
        ClubBook.create(club: @club, book: @existing_book, read_book: false, current_book: true)
      end
      redirect_to @club
    else
      if @book.save
        if @club.find_current_book != "No book"
          ClubBook.create(club: @club, book: @book, read_book: false, current_book: false)
        else
          ClubBook.create(club: @club, book: @book, read_book: false, current_book: true)
        end
        redirect_to @club
      else
        render :external
      end
      @categories.each do |category|
        if Category.find_by_name(category)
          @category = Category.find_by_name(category)
        else
          @category = Category.create(name: category)
        end
        BookCategory.create(book: @book, category: @category)
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :syllabus, :author, :image_url)
  end

end
