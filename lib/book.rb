require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date, label: nil, author: nil, genre: nil)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_hash
    hash = {
      publisher: publisher,
      cover_state: cover_state,
      label: @label.to_hash,
      author: @author.to_hash,
      id: @id
    }
    super.merge(hash)
  end

  private

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
