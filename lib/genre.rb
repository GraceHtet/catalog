require_relative './music_album'
class Genre
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_hash
    {
      id: @id,
      name: name
    }
  end
end

# p genre = Genre.new('Country')
# p album = MusicAlbum.new(false, '2000-3-3')
# genre.add_item(album)

# p genre

# p album
