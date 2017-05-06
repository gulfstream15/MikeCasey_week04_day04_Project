require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/title.rb')

# INDEX - READ  
get '/titles' do
  @titles = Title.all()
  erb ( :"titles/index" )
end

# CREATE - CREATE
post '/titles' do
  @titles = Title.new(params)
  @titles.save()
  redirect '/titles'
end