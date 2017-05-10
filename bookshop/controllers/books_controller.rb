require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')

# READ  
get '/books' do
  @books = Book.all()
  erb ( :"books/index" )
end

# CREATE 
get '/books/new' do
  @books = Book.all()
  @authors = Author.all()
  erb( :"books/new" )
end

# CREATE 
post '/books' do
  @books = Book.new(params)
  @books.save()
  redirect '/books'
end

# SHOW
get '/books/:id' do 
  @book = Book.find( params[:id] )
  erb( :"books/show" )
end

# EDIT
get '/books/:id/edit' do
  @book = Book.find( params[:id] )
  erb( :"books/edit")
end

# UPDATE
post '/books/:id' do 
  @book = Book.new( params )
  @book.update()
  erb( :"books/update")
end

# DELETE
post '/books/:id/delete' do
  @book = Book.find( params[:id] )
  @book.delete()
  erb( :"books/destroy")
end



