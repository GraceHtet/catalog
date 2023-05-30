require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
