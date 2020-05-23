require 'pry'

class Row
    attr_accessor :cells

    def initialize(cells)
        @cells = cells
    end

    def check_for_matching_cells  
        var = @cells.uniq { |cell| cell.occupier }
        #all the unique values in the collection of cells
        binding.pry
    end
end

class Cell
    attr_reader :number
    attr_accessor :occupier

    def initialize(number)
        @number = number

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
        moves = {"X" => [], "O" => []}
        xs = []
        os = []
        @cells.each do |cell|
            if cell.occupier == "X"
                xs.push(cell.number)
            elsif 
                cell.occupier == "O"
                os.push(cell.number)
            end
        end
        moves["X"] = xs
        moves["O"] = os
        return moves
    end

    def get_available_positions
        available = []
        @cells.each do |cell|
            if cell.occupier == nil
                available.push(cell.number)
            end
        end
        return available
    end

    def set_user_turn(player_token, grid_number)
        cell = @cells.find { |cell| cell.number == grid_number }
        cell.occupier = player_token
    end

    def get_winner
        #IMPLEMENT
        #RETURNS -> String: X or O or nil
        
        #Comment:
        #needs to query rows for 3 Xs or Os
        check_for_matching_cells
        #return nil for now
        return nil
    end
end