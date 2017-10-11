require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "
        INSERT INTO artists
        (
          name
        )
        VALUES
        (
          $1
        )
        RETURNING *
      "
      values = [@name]
      saved_artist = SqlRunner.run(sql, values)
      @id = saved_artist[0]['id'].to_i
  end

    def self.all()
      sql = "SELECT * FROM artists"
      values = []
      artists = SqlRunner.run(sql, values)
      artists_as_objects = artists.map{|artist| Artist.new(artist)}
      return artists_as_objects
    end


    def find_albums()
      sql = "SELECT * FROM albums WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      found_albums = results.map{|album| Album.new(album)}
      return found_albums
    end

    def update()
      sql = "UPDATE artists
           SET (
           name
           ) =
           (
            $1
           ) WHERE id = $2
           "
           values = [@name, @id]
           SqlRunner.run(sql, values)
    end

    def self.delete_all
      sql = "DELETE FROM artists"
         values = []
        SqlRunner.run(sql, values)
    end

end
