require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/author.rb')

# INDEX - READ  
get '/authors' do
  @authors = Author.all()
  for author in @authors 
   puts "each author is #{author}"
  end
  erb ( :"authors/index" )
  #erb ( :index )
end

# CREATE - CREATE
post '/authors' do
  @authors = Author.new(params)
  @authors.save()
  redirect '/authors'
end