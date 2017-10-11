require('pry')
require_relative('models/album.rb')
require_relative('models/artist.rb')

Album.delete_all
Artist.delete_all


artist_1 = Artist.new({'name' => 'Stolen Babies'})
artist_1.save()


album_1 = Album.new({'title' => 'There will be squabbles ahead',
  'genre' => 'alternative',
  'artist_id' => artist_1.id()})
album_1.save()

album_2 = Album.new({'title' => 'Naught',
  'genre' => 'alternative',
  'artist_id' => artist_1.id()})
album_2.save()

album_3 = Album.new({'title' => '4 Song Demo',
  'genre' => 'alternative',
  'artist_id' => artist_1.id()})
album_3.save()

binding.pry
nil
