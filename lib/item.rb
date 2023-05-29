require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :author
  def initialize(publish_date, archived, id: Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.item << self unless @genre.nil?
  end

  def author=(author)
    @author = author
    author.items << self unless @author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.item << self unless @label.nil?
  end

  def can_be_archived?
    cur_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    cur_year - publish_year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
