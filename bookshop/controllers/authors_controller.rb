require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/author.rb')

# INDEX - READ  
get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end

# CREATE - CREATE
post '/authors' do
  @authors = Author.new(params)
  @authors.save()
  redirect '/authors'
end