# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reviewer.destroy_all
Book.destroy_all

Book.create! [
  { name: "Eloquent Ruby", author: "Russ Olsen" },
  { name: "Beginning Ruby", author: "Peter Cooper" },
  { name: "Metaprogramming Ruby 2", author: "Paolo Perrotta" },
  { name: "Design Patterns in Ruby", author: "Russ Olsen" },
  { name: "The Ruby Programming Language", author: "David Flanagan" }
]

# create 100 books 
100.times { |i| Book.create! name: "Book#{i}", author: "Author#{i}"}

eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
  { title: "Wow", note: "Great book to learn Ruby"},
  { title: "Funny", note: "Doesn't put you to sleep"}
]

reviewers = Reviewer.create! [
  { name: "Joe", password: "abc123" },
  { name: "Jim", password: "abc123" }
]

Book.all.each do |book|
  book.reviewer = reviewers.sample
  book.save!
end