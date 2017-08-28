require_relative( '../db/sql_runner' )
require_relative( './artists' )

class Album

  attr_reader( :id, :markup )
  attr_accessor( :album_name, :stock, :genre, :artist_id, :sale_price, :buy_price)

  def initialize( details )
    @id = details['id'].to_i
    @album_name = details['album_name']
    @stock = details['stock'].to_i
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
    @sale_price = details['sale_price'].to_i
    @buy_price = details['buy_price'].to_i
    @markup= @sale_price - @buy_price
  end

  def save()
    sql = 'INSERT INTO albums
    (
    album_name,
    stock,
    genre,
    artist_id,
    sale_price,
    buy_price
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id;'
    values = [@album_name, @stock, @genre, @artist_id, @sale_price, @buy_price]
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
    sql = 'SELECT * FROM albums WHERE id = $1'
    values = [id]
    results = SqlRunner.run( sql, values )
    album = Album.new( results[0] )
    return album
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE albums SET
    (
    album_name,
    stock,
    genre,
    artist_id,
    sale_price,
    buy_price
    )
    =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7;"
    values = [@album_name, @stock, @genre, @artist_id, @sale_price, @buy_price, @id]
    SqlRunner.run( sql, values )
  end

  def self.map_items(rows)
    return rows.map { |row| Album.new(row) }
  end

  def artist()
    sql = 'SELECT artist_name FROM artists
      WHERE id = $1;'
      values = [@artist_id]
      results = SqlRunner.run( sql, values )
      artists = results.map { |result| Artist.new(result) }
      return artists.first
      # return Artist.map_items(results)
    end

    def stock_level()
      return "Low" if @stock <= 5
      return "High" if @stock >= 11
      return "Medium" if @stock = (5..10)
    end







end
