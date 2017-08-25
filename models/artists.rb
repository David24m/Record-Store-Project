require_relative( '../db/sql_runner' )
require_relative( './albums' )

class Artist

  attr_reader( :id )
  attr_accessor( :artist_name)

  def initialize( details )
    @id = details['id'].to_i
    @artist_name = details['artist_name']
  end

  def save()
    sql = "INSERT INTO artists
    (
    artist_name
    )
    VALUES
    (
    $1
    )
    RETURNING id;"
    values = [@artist_name]
    artists = SqlRunner.run( sql, values ).first()
    @id = artists['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM artists;'
    values = []
    results = SqlRunner.run( sql, values )
    artists = results.map { |artist| Artist.new(artist) }
    return artists
  end

  def self.find(id)
    sql = 'SELECT * FROM artists WHERE id = $1;'
    values = [id]
    results = SqlRunner.run( sql, values )
    artists = Artist.new( results[0] )
    return artist
  end

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    values = []
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = 'DELETE FROM artists WHERE id = $1;'
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = 'UPDATE artists SET
    (
    artist_name
    )
    =
    ($1, $2)
    WHERE id = $3;'
    values = [@artist_name, @id]
    SqlRunner.run( sql, values )
  end

  def self.map_items(rows)
    return rows.map { |row| Artist.new(row) }
  end

  def album()
    sql = 'SELECT albums.* FROM albums
      INNER JOIN artists ON artist_id = artists.id
      WHERE artist_id = $1;'
      values = [@id]
      results = SqlRunner.run( sql, values )
      return Album.map_items(results)

      # result = albums.map { |album| Album.new( album ) }
      # return result
    end




end
