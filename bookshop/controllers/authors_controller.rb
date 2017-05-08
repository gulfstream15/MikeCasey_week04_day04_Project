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

# CREATE - Add to the author inventory
post '/authors' do
  @authors = Author.new(params)
  @authors.save()
  redirect '/authors'
end

# DESTROY DELETE
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

# SHOW
get '/authors/:id' do 
  @author = Author.find( params[:id] )
  erb( :"authors/show" )
end