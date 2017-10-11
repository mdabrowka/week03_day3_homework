require('pry')
require_relative('models/album.rb')
require_relative('models/artist.rb')


artist_1 = Artist.new({'name' => 'Stolen Babies'})
artist_1.save()


album_1 = Album.new({'title' => 'There will be squabbles ahead',
  'artist_id' => artist_1.id()})
album_1.save()



binding.pry
nil
