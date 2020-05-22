class Grid
    attr_accessor :players
    attr_accessor :rows
    attr_accessor :cells
end

class Row
    attr_accessor :cells

    def check_for_winning_line
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
    attr_reader :name
    attr_reader :player_number

    def initialize(name, player_number)
        @name = name
        @player_number = player_number
    end
end

class GameCoord
    attr_accessor :playing_grid
    attr_accessor :players

    def initialize
        @players = []
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
        rows[0] = [cells[0,0], cells[0,1], cells[0,2]]

        #Middle horizontal row
        rows[1] = [cells[1,0], cells[1,1], cells[1,2]]

        #add reference to 3 cells in each row
        #add cells and rows to grid
        
    end

    def set_user_turn(user_turn)
        #user_turn is integer (1 to 9) and already validated
    end

    def get_previous_moves
        #IMPLEMENT
        #hash with x => [comma separated positions]
        #same for y
        return {}
    end

    def get_available_positions
        #IMPLEMENT
    end

    def get_winner
        #IMPLEMENT
        #return player number of winner (1 or 2)
    end
end