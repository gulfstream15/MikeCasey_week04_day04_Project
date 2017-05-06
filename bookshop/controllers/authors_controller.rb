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

# # SHOW - READ see RESTful table we need to write a show.erb
# get '/authors/:id' do
#   # id_from_route
#   @author = Author.find( params[:id] )
#   erb( :"authors/show" )            
# end

# CREATE - Add to the author inventory
post '/authors' do
  @authors = Author.new(params)
  @authors.save()
  redirect '/authors'
end