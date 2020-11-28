class BooksController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def index
    if params[:query]
      @books = BooksApiFetcher.execute(params[:query])
    else
      @books = Book.all
    end
  end

  def show
    @book = BookApiFetcher.execute(params[:id])
  end
end
