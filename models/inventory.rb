# require_relative( '../db/sql_runner' )
#
# class Inventory
#
#   attr_reader( :id )
#   attr_accessor( :album_id, :artist_id)
#
#   def initialize( details )
#     @id = details['id'].to_i
#     @album_id = details['album_id'].to_i
#     @artist_id = details['artist_id'].to_i
#   end
#
#   def save()
#     sql = "INSERT INTO inventory
#     (
#     album_id,
#     artist_id
#     )
#     VALUES
#     (
#     $1, $2
#     )
#     RETURNING id;"
#     values = [@album_id, @artist_id]
#     results = SqlRunner.run( sql, values ).first
#     @id = results['id'].to_i
#   end
#
#   def self.all()
#     sql = 'SELECT * FROM inventory;'
#     values = []
#     results = SqlRunner.run( sql, values )
#     return results.map { |item| Inventory.new(item) }
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM inventory;"
#     values = []
#     SqlRunner.run( sql, values )
#   end
#
#   def delete()
#     sql = "DELETE FROM inventory WHERE id = $1;"
#     values = [@id]
#     SqlRunner.run( sql, values )
#   end
#
#   def update()
#     sql = "UPDATE artists SET
#     (
#     album_id,
#     artist_id
#     )
#     WHERE
#     (
#     $1, $2
#     )
#     WHERE id = $3;"
#     values = [@album_id, @artist_id, @id]
#     SqlRunner.run( sql, values )
#   end
#
#   def album()
#     sql = "SELECT * FROM albums
#     WHERE id = $1;"
#     values = [@album_id]
#     results = SqlRunner.run( sql, values )
#     return Album.new( results.first )
#   end
#
#   def artist()
#     sql = "SELECT * FROM artists
#     WHERE id = $1;"
#     values = [@artist_id]
#     results = SqlRunner.run( sql, values )
#     return Artist.new( results.first )
#   end
#
#
#
# end
