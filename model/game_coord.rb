require 'pry'

class Row
    attr_accessor :cells

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
        @cells = Array.new
        9.times do |number|
            @cells.push(Cell.new(number))
        end

        @rows = Array.new(8, Row.new)
        @rows[0].cells = @cells.select { |cell| [1, 2, 3].include? cell.number }
        binding.pry
        #@rows[1].cells = @cells.select { |cell| [1, 2, 3].include? cell.number }
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