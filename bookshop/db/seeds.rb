require_relative( '../models/author.rb' )
require_relative( '../models/title.rb' )
require('pry-byebug')

Author.delete_all()
Title.delete_all()

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

title1 = Title.new({
  'book_title' => "The Enormous Crocodile"
})

title1.save()

title2 = Title.new({
  'book_title' => "The Gruffalo"
})

title2.save()

binding.pry
nil
