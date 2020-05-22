require 'pry'

class Row
    attr_accessor :cells

    def initialize(cells)
        @cells = cells
    end

    def check_for_winning_line
    end
end

class Cell
    attr_reader :number
    attr_accessor :occupier

    def initialize(number)
        @number = number
        @occupier = ""
    end
end

class GameCoord
    def initialize
        @cells = []
        @rows = []

        for i in 1..9
            @cells.push(Cell.new(i))
        end

        @rows.push(Row.new(@cells.select { |cell| [1, 2, 3].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [4, 5, 6].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [7, 8, 9].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [1, 4, 7].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [2, 5, 8].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [3, 6, 9].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [1, 5, 9].include? cell.number }))
        @rows.push(Row.new(@cells.select { |cell| [3, 5, 7].include? cell.number }))
    end

    def get_previous_moves
        #IMPLEMENT
        #RETURNS -> Hash: e.g.{X => [1, 2, 9], O => [3, 4]}

        #Comment:
        #needs to query each cell for X or O
        return {}
    end

    def get_available_positions
        #IMPLEMENT
        #RETURNS -> Array[Integer]: e.g. [2, 4, 6, 9]

        #Comment:
        #needs to query each cell for no previous move
    end

    def set_user_turn(player_token, grid_number)
        #IMPLEMENT
        #RETURNS -> void
        #grid_number is Integer (1 to 9) and already validated
        #player_token is String: X or O
        
        #Comment:
        #needs to assign player token to appropriate cell
    end

    def get_winner
        #IMPLEMENT
        #RETURNS -> String: X or O or nil

        #Comment:
        #needs to query rows for 3 Xs or Os
    end
end