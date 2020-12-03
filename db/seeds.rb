# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Club.destroy_all
Book.destroy_all
User.destroy_all
puts "Seeding users now..."

users = 10.times.map do
User.create!(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "asdfasdf",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    )
end

puts "Finished with users"

# Trials
# https://www.googleapis.com/books/v1/volumes?q=the%20vanishing%20half&langRestrict=en&key=AIzaSyB3EGuoo3CiEqrXc9DbpG6nU4ieOtR5fio
# https://books.googleapis.com/books/v1/volumes/gqX7rQEACAAJ?key=AIzaSyB3EGuoo3CiEqrXc9DbpG6nU4ieOtR5fio


puts "Seeding books now..."
books = Book.create!([
  {
    title: "The Vanishing Half",
    author: "Brit Bennett",
    syllabus: "The Vignes twin sisters will always be identical. But after growing up together in a small, southern black community and running away at age sixteen, it's not just the shape of their daily lives that is different as adults, it's everything: their families, their communities, their racial identities. Ten years later, one sister lives with her black daughter in the same southern town she once tried to escape. The other secretly passes for white, and her white husband knows nothing of her past. Still, even separated by so many miles and just as many lies, the fates of the twins remain intertwined. What will happen to the next generation, when their own daughters' story lines intersect?

    Weaving together multiple strands and generations of this family, from the Deep South to California, from the 1950s to the 1990s, Brit Bennett produces a story that is at once a riveting, emotional family story and a brilliant exploration of the American history of passing. Looking well beyond issues of race, The Vanishing Half considers the lasting influence of the past as it shapes a person's decisions, desires, and expectations, and explores some of the multiple reasons and realms in which people sometimes feel pulled to live as something other than their origins.",
    image_url: "https://images4.penguinrandomhouse.com/cover/9780593286104",
  },
  {
    title: "The Glass Hotel",
    author: "Emily St. John Mandel",
    syllabus: "From the award-winning author of Station Eleven, a captivating novel of money, beauty, white-collar crime, ghosts, and moral compromise in which a woman disappears from a container ship off the coast of Mauritania and a massive Ponzi scheme implodes in New York, dragging countless fortunes with it.

    Vincent is a bartender at the Hotel Caiette, a five-star glass and cedar palace on an island in British Columbia. Jonathan Alkaitis works in finance and owns the hotel. When he passes Vincent his card with a tip, it's the beginning of their life together. That same day, Vincent's half-brother, Paul, scrawls a note on the windowed wall of the hotel: 'Why don't you swallow broken glass.' Leon Prevant, a shipping executive for a company called Neptune-Avramidis, sees the note from the hotel bar and is shaken to his core. Thirteen years later Vincent mysteriously disappears from the deck of a Neptune-Avramidis ship. Weaving together the lives of these characters, The Glass Hotel moves between the ship, the skyscrapers of Manhattan, and the wilderness of northern Vancouver Island, painting a breathtaking picture of greed and guilt, fantasy and delusion, art and the ghosts of our pasts.",
    image_url: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1569616608l/46060957.jpg"

  },
  {
    title: "Clap When You Land",
    author: "Elizabeth Acevedo",
    syllabus: "Clap When You Land tells the story of half-sisters who didn’t know each other existed until their father died in a plane crash. The cover shows both, mirrored in each other, along with backdrops to represent their very different lives in New York City and the Dominican Republic. It’s a brilliant representation of the two characters, and so eye-catching.",
    image_url: "https://images-na.ssl-images-amazon.com/images/I/81E1TXOrpML.jpg"

  },
  {
    title: "The Empress of Salt and Fortune",
    author: "Nghi Vo",
    syllabus: "This collection of short stories about dogs will put a tear in your eye, smile on your face, and wag in your tail.",
    image_url: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1565188992l/51190882._SX0_SY0_.jpg",
  },
  {
    title: "It is Wood, It is Stone",
    author: "Gabriella Burnham",
    syllabus: "With sharp, gorgeous prose, It Is Wood, It Is Stone takes place over the course of a year in São Paulo, Brazil, in which two women’s lives intersect.

    Linda, an anxious and restless American, has moved to São Paulo, with her husband, Dennis, who has accepted a yearlong professorship. As Dennis submerges himself in his work, Linda finds herself unmoored and adrift, feeling increasingly disassociated from her own body. Linda’s unwavering and skilled maid, Marta, has more claim to Linda’s home than Linda can fathom. Marta, who is struggling to make sense of complicated history and its racial tensions, is exasperated by Linda’s instability. One day, Linda leaves home with a charismatic and beguiling artist, whom she joins on a fervent adventure that causes reverberations felt by everyone, and ultimately binds Marta and Linda in a profoundly human, and tender, way.",
    image_url: "https://images-na.ssl-images-amazon.com/images/I/91SeBhvyM6L.jpg" 
    }
  ])

puts "Finished with books!"

puts "Seeding categories now..."
categories = Category.create!([
  {
    name: 'Contemporary'
  },
  {
    name: 'Fantasy'
  },
  {
    name: 'Science Fiction'
  },
  {
    name: 'Young Adult'
  },
  {
    name: 'Mystery'
  },
  {
    name: 'History'
  },
  {
    name: 'General'
  },
  {
    name: 'Thriller'
  },
  {
    name: 'Fiction'
  },
  {
    name: 'Literary'
  },
])

puts "Seeding book_categories now..."
book_categories = BookCategory.create([
  {
    book_id: books[0].id,
    category_id: categories[1].id
  },
  {
    book_id: books[0].id,
    category_id: categories[8].id
  },
  {
    book_id: books[1].id,
    category_id: categories[2].id
  },
  {
    book_id: books[1].id,
    category_id: categories[0].id
  },
  {
    book_id: books[2].id,
    category_id: categories[3].id
  },
  {
    book_id: books[2].id,
    category_id: categories[4].id
  },
  {
    book_id: books[3].id,
    category_id: categories[1].id
  },
  {
    book_id: books[3].id,
    category_id: categories[6].id
  },
  {
    book_id: books[4].id,
    category_id: categories[4].id
  },
  {
    book_id: books[4].id,
    category_id: categories[7].id
  },
])


puts "Seeding clubs now..."

clubs = Club.create!([
  {
    name: "Grandpa Frank and Friends",
    description: "We are a Grandson and Grandaughter creating a group for other folks to find time to connect with their elders.",
    # club_photo: "https://images.unsplash.com/photo-1595123550441-d377e017de6a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1768&q=80",
    language: "English",
    user_id: users[4].id
  },
  {
    name: "YA LGBTQ Readers",
    description: " Young Adult LGBTQ club. A safe space for kids 12-18 to share books and experiences.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    user_id: users[0].id

  },
  {
    name: "Wine Time!",
    description: "We read an array of novels and non-fiction and but we really drink more than we read. Women only please.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    user_id: users[1].id
  },
  {
    name: "Business Brunch Brunch",
    description: "Dig into some business classics and new age business books while digging into a virtual brunch.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    user_id: users[2].id
  },
  {
    name: "Aspiring Writers Club",
    description: "We read critical classic and break new writers. We also have one feedback on personal writing per week. Join us!",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "Spanish",
    user_id: users[3].id
  }])

puts "Finished with books!"

puts "Seeding club_books now..."
club_books = ClubBook.create!([{
  club_id: clubs[0].id,
  book_id: books[0].id,
  read_book: false,
  current_book: true
},
{
  club_id: clubs[1].id,
  book_id: books[1].id,
  read_book: false,
  current_book: true
},
{
  club_id: clubs[2].id,
  book_id: books[2].id,
  read_book: false,
  current_book: true
},
{
  club_id: clubs[3].id,
  book_id: books[3].id,
  read_book: false,
  current_book: true
},
{
  club_id: clubs[4].id,
  book_id: books[4].id,
  read_book: false,
  current_book: true
}])



puts "All finished"
