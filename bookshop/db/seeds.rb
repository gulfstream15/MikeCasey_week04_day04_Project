require_relative( '../models/author.rb' )
require('pry-byebug')

Author.delete_all()

author1 = Author.new({
  'first_name' => "Roald",
  'last_name' => 'Dhal'
})

author1.save

author2 = Author.new({
  'first_name' => "Julia",
  'last_name' => 'Donaldson'
})

author2.save

binding.pry
nil
