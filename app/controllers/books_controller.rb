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
    @book = GoogleApiFetcher.execute(params[:id])
  end
end
