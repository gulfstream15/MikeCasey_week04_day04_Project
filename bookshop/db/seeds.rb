require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )
require('pry-byebug')

Book.delete_all()
Author.delete_all()

author1 = Author.new({
  'first_name' => "Roald",
  'last_name' => "Dahl"
})

author1.save()

author2 = Author.new({
  'first_name' => "David",
  'last_name' => "McKee"
})

author2.save()

author3 = Author.new({
  'first_name' => "Ian",
  'last_name' => "Whybrow"
})

author3.save()

author4 = Author.new({
  'first_name' => "Julia",
  'last_name' => "Donaldson"
})

author4.save()

book1 = Book.new({
  'title' => "The Enormous Crocodile",
  'quantity' => 30,
  'buy_price' => 5.99,
  'sell_price' => 6.99,
  'author_id' => author1.id
})

book1.save()

book2 = Book.new({
  'title' => "James and the Giant Peach",
  'quantity' => 25,
  'buy_price' => 7.99,
  'sell_price' => 8.99,
  'author_id' => author1.id
})

book2.save()

book3 = Book.new({
  'title' => "Charlie and the Chocolate Factory",
  'quantity' => 35,
  'buy_price' => 9.99,
  'sell_price' => 10.99,
  'author_id' => author1.id
})

book3.save()

book4 = Book.new({
  'title' => "The Fantastic Mr Fox",
  'quantity' => 35,
  'buy_price' => 11.99,
  'sell_price' => 12.99,
  'author_id' => author1.id
})

book4.save()

book5 = Book.new({
  'title' => "Elmer the Patchwork Elephant",
  'quantity' => 15,
  'buy_price' => 13.99,
  'sell_price' => 14.99,
  'author_id' => author2.id
})

book5.save()

book6 = Book.new({
  'title' => "Elmer and Super El",
  'quantity' => 15,
  'buy_price' => 15.99,
  'sell_price' => 16.99,
  'author_id' => author2.id
})

book6.save()

book7 = Book.new({
  'title' => "Elmer and Wilbur",
  'quantity' => 15,
  'buy_price' => 17.99,
  'sell_price' => 18.99,
  'author_id' => author2.id
})

book7.save()

book8 = Book.new({
  'title' => "Harry and the Dinosaurs at the Museum",
  'quantity' => 35,
  'buy_price' => 19.99,
  'sell_price' => 20.99,
  'author_id' => author3.id
})

book8.save()

book9 = Book.new({
  'title' => "Harry and the Dinosaurs Go Wild",
  'quantity' => 35,
  'buy_price' =>21.99,
  'sell_price' => 22.99,
  'author_id' => author3.id
})

book9.save()

book10 = Book.new({
  'title' => "Harry and the Dinosaurs United",
  'quantity' => 3,
  'buy_price' => 23.99,
  'sell_price' => 24.99,
  'author_id' => author3.id
})

book10.save()

book11 = Book.new({
  'title' => "The Gruffalo",
  'quantity' => 6,
  'buy_price' => 23.99,
  'sell_price' => 24.99,
  'author_id' => author4.id
})

book11.save()

book12 = Book.new({
  'title' => "What the Ladybird Said",
  'quantity' => 6,
  'buy_price' => 23.99,
  'sell_price' => 24.99,
  'author_id' => author4.id
})

book12.save()

book13 = Book.new({
  'title' => "Postman Bear",
  'quantity' => 7,
  'buy_price' => 13.99,
  'sell_price' => 14.99,
  'author_id' => author4.id
})

book13.save()

book14 = Book.new({
  'title' => "Hide and Seek Pig",
  'quantity' => 7,
  'buy_price' => 12.99,
  'sell_price' => 13.99,
  'author_id' => author4.id
})

book14.save()


binding.pry
nil
