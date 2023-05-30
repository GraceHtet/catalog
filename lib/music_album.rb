require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify, publish_date, archived, id: Random.rand(1..1000))
    super(publish_date, archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
