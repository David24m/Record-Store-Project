require_relative( "../models/artists")
require_relative( "../models/albums" )
require_relative( "../models/inventory" )

require('pry-byebug')

Artist.delete_all()
Album.delete_all()
Inventory.delete_all()

artist1 = Artist.new( { 'artist_name' => "Switchfoot" } )
artist1.save()
artist2 = Artist.new( { 'artist_name' => "3 Doors Down" } )
artist2.save()
artist3 = Artist.new( { 'artist_name' => "Ed Sheeran" } )
artist3.save()
artist4 = Artist.new( { 'artist_name' => "Eminem" } )
artist4.save()

album1 = Album.new( { 'album_name' => "Vice Verses", 'stock' => 5, 'genre' => 'Rock' } )
album1.save()
album2 = Album.new( { 'album_name' => "Where The Light Shines Through", 'stock' => 10, 'genre' => 'Rock' } )
album2.save()
album3 = Album.new( { 'album_name' => "Hello Hurricane", 'stock' => 15, 'genre' => 'Rock' } )
album3.save()
album4 = Album.new( { 'album_name' => "Away From The Sun", 'stock' => 8, 'genre' => 'Rock' } )
album4.save()
album5 = Album.new( { 'album_name' => "Us And The Night", 'stock' => 11, 'genre' => 'Rock' } )
album5.save()
album6 = Album.new( { 'album_name' => "+", 'stock' => 20, 'genre' => 'Pop' } )
album6.save()
album7 = Album.new( { 'album_name' => "x", 'stock' => 2, 'genre' => 'Pop' } )
album7.save()
album8 = Album.new( { 'album_name' => "Marshall Mathers", 'stock' => 30, 'genre' => 'Rap' } )
album8.save()

inventory1 = Inventory.new( { 'album_id' => 1, 'artist_id' => 1 } )
inventory1.save()
inventory2 = Inventory.new( { 'album_id' => 2, 'artist_id' => 1 } )
inventory2.save()
inventory3 = Inventory.new( { 'album_id' => 3, 'artist_id' => 1 } )
inventory3.save()
inventory4 = Inventory.new( { 'album_id' => 4, 'artist_id' => 2 } )
inventory4.save()
inventory5 = Inventory.new( { 'album_id' => 5, 'artist_id' => 2 } )
inventory5.save()
inventory6 = Inventory.new( { 'album_id' => 6, 'artist_id' => 3 } )
inventory6.save()
inventory7 = Inventory.new( { 'album_id' => 7, 'artist_id' => 3 } )
inventory7.save()
inventory8 = Inventory.new( { 'album_id' => 8, 'artist_id' => 4 } )
inventory8.save()

pry.binding
nil
