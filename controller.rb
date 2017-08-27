require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( './models/artists.rb' )
require_relative( './models/albums.rb' )

#INDEX
get '/recordstore' do
  @albums = Album.all
  @artists = Artist.all
  erb(:index)
end

#new
get '/recordstore/new/artist' do
  @artists = Artist.all
  erb( :new_artist )
end

#CREATE
post '/recordstore/new' do
  @artists = Artist.new(params)
  @artists.save
  redirect to '/recordstore'
end

#new
get '/recordstore/new/album' do
  @artists = Artist.all
  erb( :new )
end

#CREATE
post '/recordstore' do
  @albums = Album.new(params)
  @albums.save
  redirect to '/recordstore'
end

#EDIT
get '/recordstore/:id/edit' do
  @albums = Album.find( params[:id] )
  @artists = Artist.all
  erb( :edit )
end

#UPDATE
post '/recordstore/:id' do
  @albums = Album.new( params )
  @albums.update()
  redirect to '/recordstore'
end

#DELETE
post '/recordstore/:id/delete' do
  @albums = Album.find( params[:id] )
  @albums.delete
  redirect '/recordstore'
end
