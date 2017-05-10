require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/author.rb')

# INDEX - READ  
get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end

# NEW - CREATE
get '/authors/new' do
  erb( :"authors/new" )
end

# CREATE 
post '/authors' do
  @authors = Author.new(params)
  @authors.save()
  redirect '/authors'
end

# DESTROY 
post '/authors/:id/delete' do
  # id here is one specific author
  @author = Author.find( params[:id] )
  @author.delete()
  erb( :"authors/destroy")
end

# EDIT
get '/authors/:id/edit' do
  # get the current book
  @author = Author.find( params[:id] )
  erb( :"authors/edit")
end

## SHOW
get '/authors/:id' do 
  @author = Author.find( params[:id] )
  erb( :"authors/show" )
end

# EDIT
get '/authors/:id/edit' do
  # get the current author
  @author = Author.find( params[:id] )
  erb( :"books/author")
end

# UPDATE
post '/authors/:id' do 
  @author = Author.new( params )
  @author.update()
  erb( :"authors/update")
end

# DELETE
post '/authors/:id/delete' do
  @author = Book.find( params[:id] )
  @author.delete()
  erb( :"authors/destroy")
end
