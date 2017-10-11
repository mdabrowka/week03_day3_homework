require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist
attr_reader :id, :name

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

end
