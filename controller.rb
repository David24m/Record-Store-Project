# require( 'sinatra' )
# require( 'sinatra/contrib/all' ) if development?
# require_relative( './models/artists.rb' )
# require_relative( './models/albums.rb' )
#
# #INDEX
# get '/recordstore' do
#   @album = Album.all
#   erb(:index)
# end
#
# #new
# get '/recordstore/new' do
#   @artists = Artist.all
#   erb( :new )
# end
#
# #CREATE
