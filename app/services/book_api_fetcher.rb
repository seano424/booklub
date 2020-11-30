class BookApiFetcher
  include Executable

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}"
  end

  def execute
    doc = Nokogiri::HTML(URI.open(@url))
    description_text = doc.search('description').first.text
    description = description_text[0, description_text.length - 3]
    
    # image_url = doc.search('image_url').text
    author = doc.search('name').first.text
    title = doc.at_xpath('//original_title').text

    book_title = title.gsub(" ", "%20")
    # raise
    google_url          = "https://www.googleapis.com/books/v1/volumes?q=#{book_title}&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
    document_serialized = open(google_url).read
    document            = JSON.parse(document_serialized)
    isbn                = document['items'][0]['volumeInfo']['industryIdentifiers'][0]['identifier']
    # title               = document['items'][0]['volumeInfo']['title']
    # authors               = document['items'][0]['volumeInfo']['authors']
    # description         = document['items'][0]['volumeInfo']['description']
    page_count         = document['items'][0]['volumeInfo']['pageCount']
    categories         = document['items'][0]['volumeInfo']['categories']
    avg_rating         = document['items'][0]['volumeInfo']['avgRating']
    image_thumbnail         = document['items'][0]['volumeInfo']['imageLinks']['thumbnail']

    

    image_sm = "http://covers.openlibrary.org/b/isbn/#{isbn}-S.jpg"
    image_md = "http://covers.openlibrary.org/b/isbn/#{isbn}-M.jpg"
    image_lg = "http://covers.openlibrary.org/b/isbn/#{isbn}-L.jpg"
    
    {
      author: author,
      title: title,
      description: description, 
      page_count: page_count, 
      categories: categories, 
      avg_rating: avg_rating, 
      image_sm: image_sm,
      image_md: image_md,
      image_lg: image_lg,
      image_thumbnail: image_thumbnail,
      image_nil: image_nil
    }
  end
end

#  @book = BookApiFetcher.execute(value)