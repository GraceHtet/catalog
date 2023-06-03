require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date, label: nil, author: nil, genre: nil)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
  end

  def to_hash
    hash = {
      id: @id,
      on_spotify: on_spotify,
      genre: @genre.to_hash,
      label: @label.to_hash,
      author: @author.to_hash
    }
    super.merge(hash)
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
