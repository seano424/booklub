class BookApiFetcher
  include Executable

  def initialize(book_query)
    @book_query = book_query.gsub(" ", "+")
    @url = "https://www.goodreads.com/search/index.xml?key=#{ENV['GOODREADS_API_KEY']}&q="
  end

  def execute
    # raise
    search = @url + @book_query
    doc = Nokogiri::HTML(URI.open(search)) 
    book = doc.xpath('//best_book').map do |best_book|  
      name =best_book.search('name').text 
      title =best_book.search('title').text 
      image_url = best_book.search('image_url').text 
      book_id = best_book.search('id').text 
      {name: name, title: title, image_url: image_url, book_id: book_id}
    end
  end
end


#  @books = BookApiFetcher.execute(book_query) (edited) 

