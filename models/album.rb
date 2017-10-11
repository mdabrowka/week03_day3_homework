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



end
