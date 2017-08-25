require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( './models/albums.rb' )
require_relative( './models/artists.rb' )
require_relative( './models/inventory.rb' )

#INDEX
get '/recordstore' do
  @inventory = Inventory.all
  erb(:index)
end
