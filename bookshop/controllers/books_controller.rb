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

# EDIT
get '/books/:id/edit' do
  # get the current book
  @book = Book.find( params[:id] )
  erb( :"books/edit")
end

# SHOW
get '/books/:id' do 
  puts "CALLING SHOW id is #{params[:id]}"
  @book = Book.find( params[:id] )
  puts "@book.id is #{@book.id}"
  erb( :"books/show" )
end

post '/books/:id/delete' do
  @book = Book.find( params[:id] )
  @book.delete()
  # Book.destroy(params[:id])
  erb( :"books/show")
  # redirect to("/books")
end

#  DESTROY DELETE
# post '/pizzas/:id/delete' do
#   # id here is one specific pizza
#   @pizza = Pizza.find( params[:id] )
#   @pizza.delete()
#   # For debugging can be useful to use:
#   # puts @pizza.delete()
#   # this can also be used INSTEAD of destroy.erb
#   # redirect('/pizzas')
#   erb( :destroy)
# end

# DESTROY DELETE
# post '/books/:id/delete' do
#   # id here is one specific book
#   @book = Book.find( params[:id] )
#   @book.delete()
#   # erb( :"books/destroy")
#   erb( :"books/show")
# end

