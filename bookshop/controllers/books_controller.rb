require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')

# INDEX - READ  
get '/books' do
  @books = Book.all()
  erb ( :"books/index" )
end

# NEW - CREATE
get '/books/new' do
  erb( :"books/new" )
end

# CREATE - CREATE
post '/books' do
  @books = Book.new(params)
  @books.save()
  redirect '/books'
end