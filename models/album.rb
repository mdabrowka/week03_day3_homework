require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album
  attr_reader :id, :title, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "
      INSERT INTO albums
      (
        title,
        artist_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *
    "
    values = [@title, @artist_id]
    saved_album = SqlRunner.run(sql, values)
    @id = saved_album[0]['id'].to_i
  end

end
