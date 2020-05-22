class Grid
    attr_accessor :players
    attr_accessor :rows
    attr_accessor :cells
end

class Row
    attr_accessor :cells

    def check_for_game_end
    end
end

class Cell
    attr_reader :player
    #attr_accessor :rows - needed or not?
    attr_accessor :coord

    def player=(player) 
        @player = player 
    end
    

    def is_blank?
        return self.player == nil
    end
end

class Player
    attr_accessor :name
    attr_accessor :player_number
end

class GameCoord
    attr_accessor :playing_grid
    attr_accessor :players

    def initialize
        @players = [Player.new, Player.new]
        @playing_grid = Grid.new
        populate_grid(@playing_grid)
    end

    def populate_grid(grid)
        #[[cell, cell, cell], 
        #[cell, cell, cell],
        #[cell, cell, cell]]

        cells = Array.new(3, Array.new(3, Cell.new))
        rows = Array.new(8, Row.new)

        #Top horizontal row
        row[0] = [cells[0,0], cells[0,1], cells[0,2]]

        #Middle horizontal row
        row[1] = [cells[1,0], cells[1,1], cells[1,2]]

        #add reference to 3 cells in each row
        #add cells and rows to grid
        
    end
end