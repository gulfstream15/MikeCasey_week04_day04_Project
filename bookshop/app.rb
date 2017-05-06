require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/authors_controller')
require_relative('controllers/titles_controller')

get '/' do
  erb( :index )
end

