class BookIdApiFetcher
  include Executable

  def initialize(id_value)
    @book_id = id_value
    @url = "https://www.goodreads.com/book/show/#{@book_id}.xml?key=#{ENV['GOODREADS_API_KEY']}&q="
  end

  def execute
    doc = Nokogiri::HTML(URI.open(@url))
    description = doc.search('description').first.text
    full_description = description[0, description.length - 3]
    image_url = doc.search('image_url').text
    author = doc.search('name').first.text
    title = doc.at_xpath('//original_title').text
    isbn = doc.search('isbn').text
    { description: full_description, image_url: image_url.strip, author: author, isbn: isbn, title: title }
  end
end

#  @books = BookIdApiFetcher.execute(value)