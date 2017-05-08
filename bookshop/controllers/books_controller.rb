require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')

# INDEX - READ  
get '/books' do
  @books = Book.all()
  erb ( :"books/index" )
end

# NEW - CREATE - get the authors
get '/books/new' do
  @books = Book.all()
  @authors = Author.all()
  erb( :"books/new" )
end

# CREATE - CREATE
post '/books' do
  @books = Book.new(params)
  @books.save()
  redirect '/books'
end

# DESTROY DELETE
post '/books/:id/delete' do
  # id here is one specific book
  @book = Book.find( params[:id] )
  @book.delete()
  erb( :destroy)
end

# EDIT
get '/books/:id/edit' do
  # get the current book
  @book = Book.find( params[:id] )
  erb( :edit)
end
