class BookApiFetcher
  include Executable
  include ActionView::Helpers::SanitizeHelper

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}"
  end

  def execute
    # Goodreads
    doc = Nokogiri::XML(URI.open(@url))
    description = doc.search('description').first.text
    image_url = doc.at('image_url').content
    author = doc.search('name').first.text
    title = doc.at('title').content

    # Google 1
    book_title = title.gsub(" ", "%20")
    book_author = author.gsub(" ", "%20")
    google_url          = "https://www.googleapis.com/books/v1/volumes?q=#{book_title}%20#{book_author}&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
    document_serialized = open(google_url).read
    document            = JSON.parse(document_serialized)
    book_id = document['items'][0]['id']

    # Google 2
    id_url = "https://books.googleapis.com/books/v1/volumes/#{book_id}?key=#{ENV['GOOGLE_API_KEY']}"
    google_serialized = open(id_url).read
    google            = JSON.parse(google_serialized)

    isbn                = google['volumeInfo']['industryIdentifiers'][0]['identifier']
    # authors           = google['volumeInfo']['authors']
    # description         = google['volumeInfo']['description']
    page_count          = google['volumeInfo']['pageCount']
    categories          = google['volumeInfo']['categories']
    categories = categories.join(', ')
    categories = categories.gsub(' / ', ', ')
    categories = categories.gsub('Fiction, ', '')
    categories = categories.gsub('General, ', '')
    avg_rating          = google['volumeInfo']['avgRating']
    image               = google['volumeInfo']['imageLinks']['thumbnail']
    image_lg            = google['volumeInfo']['imageLinks']['large']
    image_md            = google['volumeInfo']['imageLinks']['medium']
    image_sm            = google['volumeInfo']['imageLinks']['small']
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