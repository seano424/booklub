class BookApiFetcher
  include Executable
  include ActionView::Helpers::SanitizeHelper

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}"
    
    # google =  "https://books.googleapis.com/books/v1/volumes?q=20%2C000%20Leagues%20Under%20The%20Sea&filter=ebooks&orderBy=newest&printType=BOOKS&key=#{ENV['GOOGLE_API_KEY']}"
    
  end

  def execute
    # Goodreads
    doc = Nokogiri::XML(URI.open(@url))
    description = doc.at('description').content
    thumbnail = doc.at('image_url').content
    author = doc.at('name').content
    title = doc.at('title').content
    page_count = doc.at('num_pages').content

    # Google to get ID
    author_normalized   = author.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
    title_normalized    = title.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
    book_title          = title_normalized.gsub(" ", "+")
    book_author         = author_normalized.gsub(" ", "+")
    google_url          = "https://www.googleapis.com/books/v1/volumes?q=#{book_title}%20#{book_author}&filter=ebooks&printType=BOOKS&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
    document_serialized = open(google_url).read
    document            = JSON.parse(document_serialized)
    book_id = document['items'][0]['id']

    # Google Using the ID to get Categories
    id_url = "https://books.googleapis.com/books/v1/volumes/#{book_id}?key=#{ENV['GOOGLE_API_KEY']}"
    google_serialized = open(id_url).read
    google            = JSON.parse(google_serialized)

    categories          = google['volumeInfo']['categories']
    unless categories.nil?
      categories = categories.join(', ')
      categories = categories.gsub(' / ', ', ')
      categories = categories.split(", ")
      categories = categories.uniq
      categories.join(", ")
    end
    avg_rating          = google['volumeInfo']['avgRating']
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
      image: thumbnail
    }
  end
end

#  @book = BookApiFetcher.execute(value)