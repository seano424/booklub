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

puts "Seeding books now..."
books = Book.create!([{
    title: Faker::Book.title,
    author: Faker::Book.author,
    syllabus: "An amazing journey through space in time. A page turner that will change your mind",
    # cover_phroto: "https://images.unsplash.com/photo-1518210777420-a2f84c71fffc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  },
  {
    title: Faker::Book.title,
    author: Faker::Book.author,
    syllabus: "She was born into a world in which she didn't belong. Her will and inspiration changed those alien surroundings into a world or her own.",
    # cover_photo: "https://images.unsplash.com/photo-1518210777420-a2f84c71fffc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",

  },
  {
    title: Faker::Book.title,
    author: Faker::Book.author,
    syllabus: "John was a prisoner. With nothing but a library at his fingers and revenge on his mind. Follow his journey from school of the hard knocks to school of the Harvard knocks.",
    # cover_photo: "https://images.unsplash.com/photo-1518210777420-a2f84c71fffc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",

  },
  {
    title: Faker::Book.title,
    author: Faker::Book.author,
    syllabus: "This collection of short stories about dogs will put a tear in your eye, smile on your face, and wag in your tail.",
    # cover_photo: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
  },
  {
    title: Faker::Book.title,
    author: Faker::Book.author,
    syllabus: "Our young protagonist, Shelly Eggman, takes a crack at saving her fathers used shoe store. Can her charisma and business savy get the customers to shell out the big bucks?",
    # cover_photo: "https://images.unsplash.com/photo-1519305347372-b8e8166ff254?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80",
  }])


puts "Finished with books!"

puts "Seeding clubs now..."

club = Club.create!([{
    name: "Grandpa Frank and Friends",
    description: "We are a Grandson and Grandaughter creating a group for other folks to find time to connect with their elders.",
    # club_photo: "https://images.unsplash.com/photo-1595123550441-d377e017de6a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1768&q=80",
    language: "English",
    book_id: books[4].id,
    user_id: users[4].id
  },
  {
    name: "YA LGBTQ Readers",
    description: " Young Adult LGBTQ club. A safe space for kids 12-18 to share books and experiences.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    book_id: books[0].id,
    user_id: users[0].id

  },
  {
    name: "Wine Time!",
    description: "We read an array of novels and non-fiction and but we really drink more than we read. Women only please.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    book_id: books[1].id,
    user_id: users[1].id
  },
  {
    name: "Business Brunch Brunch",
    description: "Dig into some business classics and new age business books while digging into a virtual brunch.",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "English",
    book_id: books[2].id,
    user_id: users[2].id
  },
  {
    name: "Aspiring Writers Club",
    description: "We read critical classic and break new writers. We also have one feedback on personal writing per week. Join us!",
    # club_photo: "https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    language: "Spanish",
    book_id: books[3].id,
    user_id: users[3].id
  }])


puts "All finished"
