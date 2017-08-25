require_relative( '../db/sql_runner' )

class Album

  attr_reader( :id )
  attr_accessor( :album_name, :stock, :genre)

  def initialize( details )
    @id = details['id'].to_i
    @album_name = details['album_name']
    @stock = details['stock']
    @genre = details['genre']
  end

  def save()
    sql = 'INSERT INTO albums
    (
    album_name,
    stock,
    genre
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;'
    values = [@album_name, @stock, @genre]
    results = SqlRunner.run( sql, values ).first()
    @id = results['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |album| Album.new( album ) }
  end

  def self.find(id)
    sql = 'SELECT FROM albums WHERE id = $1'
    values = [id]
    results = SqlRunner( run, values )
    album = Album.new( results [0] )
    return album
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run( sql, values )
  end

  def delete()
    sql "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE albums SET
    (
    album_name,
    stock,
    genre
    )
    =
    ($1, $2, $3)
    WHERE id = $4;"
    values = [@album_name, @stock, @genre, @id]
    SqlRunner.run( sql, values )
  end

  def self.map_items(rows)
    return rows.map { |row| Album.new(row) }
  end

  def artist()
    sql = 'SELECT artists.* FROM artists
      INNER JOIN inventory ON inventory.artist_id = artists.id
      WHERE album_id = $1;'
      values = [@id]
      results = SqlRunner.run( sql, values )
      return Artist.map_items(results)
    end

    def stock_level()
      return "Low" if @stock <= 5
      return "High" if @stock >= 11
      return "Medium" if @stock = (5..10)
    end







end
