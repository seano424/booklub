class GoogleApiFetcher
  include Executable

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}"
  end

  def execute
    # raise
    doc = Nokogiri::HTML(URI.open(@url))
    title = doc.at_xpath('//original_title').text
    book_title = title.delete(" ")
    google_url = "https://www.googleapis.com/books/v1/volumes?q=#{book_title}&langRestrict=en"
    document_serialized = open(google_url).read
    document = JSON.parse(document_serialized)
    items =document['items']
    google_id = document['items'][0]['id']
    google_id_url = "https://www.googleapis.com/books/v1/volumes/#{google_id}?key=#{ENV['GOOGLE_API_KEY']}"
    google_document_serialized = open(google_id_url).read
    google_doc = JSON.parse(google_document_serialized)
    authors = google_doc['volumeInfo']['authors']
    title = google_doc['volumeInfo']['title']
    description = google_doc['volumeInfo']['description']
    page_count = google_doc['volumeInfo']['pageCount']
    categories = google_doc['volumeInfo']['categories']
    avg_rating = google_doc['volumeInfo']['averageRating']
    smallThumbnail = google_doc['volumeInfo']['imageLinks']['smallThumbnail']
    thumbnail = google_doc['volumeInfo']['imageLinks']['thumbnail']
    
    { authors: authors, title: title, description: description, page_count: page_count, categories: categories, avg_rating: avg_rating, thumbnail: thumbnail }
  end
end

#  @books = BookIdApiFetcher.execute(value)
#  @book = GoogleApiFetcher.execute(value)