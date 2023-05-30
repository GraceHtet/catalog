require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.item << self unless @genre.nil?
  end

  def author=(author)
    @author = author
    author.items << self unless @author.instance_eval { @items }.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.instance_eval { @items }.include?(self)
  end

  def can_be_archived?
    cur_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    cur_year - publish_year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def to_hash
    {
      publish_date: publish_date,
      archived: @archived
    }
  end

  private :can_be_archived?
end
