class BookIdApiFetcher
  include Executable

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}&"
  end

  def execute
    doc = Nokogiri::XML(URI.open(@url))
    description = doc.search('description').first.text
    # raise
    image_url = doc.at('image_url').content
    author = doc.search('name').first.text
    title = doc.at('title').content
    
    google_url = "https://www.googleapis.com/books/v1/volumes?q=#{title}&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
    document_serialized = open(google_url).read
    document = JSON.parse(document_serialized)
    image_id = document['items'][0]['id']
    google_img_url = "https://books.googleapis.com/books/v1/volumes/#{image_id}?country=us&key=#{ENV['GOOGLE_API_KEY']}"
    doc_serialized = open(google_img_url).read
    doc = JSON.parse(doc_serialized)
    image_lg = doc['volumeInfo']['imageLinks']['large']
    image_md = doc['volumeInfo']['imageLinks']['medium']

    if image_md.nil?
      image = image_url
    else
      image = image_md
    end
    
    { description: description, image: image, image_lg: image_lg, author: author, title: title }


  end
end

#  @books = BookIdApiFetcher.execute(value)