require_relative './item'

class Game < Item
  attr_accessor :last_played_at
  attr_reader :multiplayer

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    hash = {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      label: @label.to_hash,
      author: @author.to_hash,
      id: @id
    }
    super.merge(hash)
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    last_played_parsed = Date.parse(@last_played_at).year
    super && current_year - last_played_parsed > 2
  end
end
