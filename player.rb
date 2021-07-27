class Player
    def initialize(name="", position = 0)
        @name = name
        @position = position
    end
    def name=(name)
        @name = name
    end
    def position=(pos)
        @position = pos
    end
    def name
        @name
    end
    def position
        @position
    end
end
