require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album
  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "
      INSERT INTO albums
      (
        title,
        genre,
        artist_id
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING *
    "
    values = [@title, @genre, @artist_id]
    saved_album = SqlRunner.run(sql, values)
    @id = saved_album[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    albums_as_objects = albums.map{|album| Album.new(album)}
    return albums_as_objects
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

end
