require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( './models/artists.rb' )
require_relative( './models/albums.rb' )

#cover page
get '/recordstore' do
  erb(:cover)
end




#INDEX
get '/recordstore/stock' do
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
  redirect to '/recordstore/new/album'
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
  redirect to '/recordstore/stock'
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
  redirect to '/recordstore/stock'
end

#DELETE
post '/recordstore/:id/delete' do
  @albums = Album.find( params[:id] )
  @albums.delete
  redirect '/recordstore/stock'
end

#EDIT
get '/recordstore/artist/:id/edit' do
  @artists = Artist.find( params[:id] )
  erb( :edit_artist )
end

#UPDATE
post '/recordstore/artist/:id' do
  @artists = Artist.new( params )
  @artists.update()
  redirect to '/recordstore/stock'
end

get '/recordstore/artist/:id/delete' do
  @artists = Artist.find( params[:id] )
  erb( :delete )
end

#DELETE
post '/recordstore/:id/artist' do
  @artists = Artist.find( params[:id] )
  @artists.delete
  redirect '/recordstore/stock'
end

#Genre find
get '/recordstore/genre' do
  @albums = Album.all.sort_by {|album| album.genre}
  @artists = Artist.all
  erb(:genre)
end
