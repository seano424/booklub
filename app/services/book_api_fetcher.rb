class BookApiFetcher
  include Executable
  include ActionView::Helpers::SanitizeHelper

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}"
  end

  def execute
    # Goodreads
    doc = Nokogiri::HTML(URI.open(@url))
    description_text = doc.search('description').first.text
    description = description_text[0, description_text.length - 3]
    author = doc.search('name').first.text
    title = doc.at_xpath('//title').text
    book_title = title.gsub(" ", "%20")
    google_url          = "https://www.googleapis.com/books/v1/volumes?q=#{book_title}&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
    document_serialized = open(google_url).read
    document            = JSON.parse(document_serialized)
    book_id = document['items'][0]['id']
    
    id_url = "https://books.googleapis.com/books/v1/volumes/#{book_id}?key=#{ENV['GOOGLE_API_KEY']}"
    doc2_serialized = open(id_url).read
    doc2            = JSON.parse(doc2_serialized)

    isbn                = doc2['volumeInfo']['industryIdentifiers'][0]['identifier']
    title               = doc2['volumeInfo']['title']
    # authors           = doc2['volumeInfo']['authors']
    description         = doc2['volumeInfo']['description']
    page_count          = doc2['volumeInfo']['pageCount']
    categories          = doc2['volumeInfo']['categories']
    avg_rating          = doc2['volumeInfo']['avgRating']
    image               = doc2['volumeInfo']['imageLinks']['thumbnail']
    image_lg            = doc2['volumeInfo']['imageLinks']['large']
    image_md            = doc2['volumeInfo']['imageLinks']['medium']
    image_sm            = doc2['volumeInfo']['imageLinks']['small']

    {
      author: author,
      title: title,
      description: strip_tags(description), 
      page_count: page_count, 
      categories: categories, 
      avg_rating: avg_rating, 
      image_sm: image_sm,
      image_md: image_md,
      image_lg: image_lg,
      image: image
    }
  end
end

#  @book = BookApiFetcher.execute(value)