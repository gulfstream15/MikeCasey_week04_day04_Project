require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )
require('pry-byebug')

Author.delete_all()
Book.delete_all()

author1 = Author.new({
  'first_name' => "Roald",
  'last_name' => 'Dhal'
})

author1.save()

author2 = Author.new({
  'first_name' => "Julia",
  'last_name' => 'Donaldson'
})

author2.save()

book1 = Book.new({
  'title' => "The Enormous Crocodile",
  'quantity' => 30,
  'author_id' => author1.id
})

book1.save()

book2 = Book.new({
  'title' => "The Gruffalo",
  'quantity' => 5,
  'author_id' => author2.id
})

book2.save()

binding.pry
nil
