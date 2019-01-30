# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed the MyFavouriteBooks DB with some movies.
more_books = [
 {:title => 'Harry Potter 1', :genere => 'Science fiction', :description => 'Harry Potter book 1', :isbn_number => '978-3-16-148410-0', :publish_date => '25-Nov-1992'},
 {:title => 'Harry Potter 2', :genere => 'Science fiction', :description => 'Harry Potter book 2', :isbn_number => '978-3-16-148410-1', :publish_date => '25-Nov-1993'},
 {:title => 'Harry Potter 3', :genere => 'Science fiction', :description => 'Harry Potter book 3', :isbn_number => '978-3-16-148410-2', :publish_date => '25-Nov-1994'},
 {:title => 'Harry Potter 4', :genere => 'Science fiction', :description => 'Harry Potter book 4', :isbn_number => '978-3-16-148410-3', :publish_date => '25-Nov-1995'},
 {:title => 'Harry Potter 5', :genere => 'Science fiction', :description => 'Harry Potter book 5', :isbn_number => '978-3-16-148410-4', :publish_date => '25-Nov-1996'}
]
more_books.each do |book|
 Book.create!(book)
end