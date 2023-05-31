require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
  end

  def to_hash
    hash = {
      id: @id,
      on_spotify: on_spotify,
      genre: @genre,
    }
    super.merge(hash)
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
