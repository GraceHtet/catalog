require_relative './item'

class Game < Item
    def initialize(multiplayer,last_played_at)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end
    def can_be_archived?
        current_year = Date.today.year
        last_played_parsed= Date.parse(@last_played_at).year
        super && current_year - last_played_parsed > 2
    end
end
