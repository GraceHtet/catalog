require 'date'

class Item
    def initialize( publish_date, archived, id: Random.rand(1..1000))
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
        author.item << self unless @author.nil?
    end

    def label=(label)
        @label = label
        label.item << self unless @label.nil?
    end
end