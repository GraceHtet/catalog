class Label
    def initialize(title, color, id: Random.rand(1..1000))
        @id = id
        @title = title
        @color = color
        @items = []
    end
end