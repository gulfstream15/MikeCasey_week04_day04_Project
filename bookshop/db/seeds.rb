require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )
require('pry-byebug')

Book.delete_all()
Author.delete_all()

author1 = Author.new({
  'first_name' => "Roald",
  'last_name' => "Dhal"
})

author1.save()

author2 = Author.new({
  'first_name' => "David",
  'last_name' => "McKee"
})

author2.save()

book1 = Book.new({
  'title' => "The Enormous Crocodile",
  'quantity' => 30,
  'author_id' => author1.id
})

book1.save()

book2 = Book.new({
  'title' => "James and the Giant Peach",
  'quantity' => 25,
  'author_id' => author1.id
})

book2.save()

book3 = Book.new({
  'title' => "Charlie and the Chocolate Factory",
  'quantity' => 35,
  'author_id' => author1.id
})

book3.save()

book4 = Book.new({
  'title' => "The Fantastic Mr Fox",
  'quantity' => 35,
  'author_id' => author1.id
})

book4.save()

book5 = Book.new({
  'title' => "Elmer the Patchwork Elephant",
  'quantity' => 15,
  'author_id' => author2.id
})

book5.save()

book6 = Book.new({
  'title' => "Elmer and Super El",
  'quantity' => 15,
  'author_id' => author2.id
})

book6.save()

book7 = Book.new({
  'title' => "Elmer and Wilbur",
  'quantity' => 15,
  'author_id' => author2.id
})

book7.save()

binding.pry
nil
