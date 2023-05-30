require_relative 'item'

class Book < Item
  def initialize(publisher, cover_state, publish_date, id: Random.rand(1..1000))
    super(publish_date, archived, id: id)
    p archived
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
