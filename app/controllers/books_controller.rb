class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    # if params[:query].present
    #   @books = Book.search_by_title_author_syllabus
    # else
    #   @book = Book.all
  end
end
