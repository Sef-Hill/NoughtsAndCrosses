class Row
    def initialize(cells)
        @cells = cells
    end

    def get_three_in_a_row  
        unique_values = @cells.uniq { |cell| cell.occupier }
        if unique_values.size == 1
            return unique_values.first.occupier
        else
            return nil
        end
    end
end

class Cell
    attr_reader :number
    attr_accessor :occupier

    def initialize(number)
        @number = number
        @occupier = nil
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

    def reset_board
        @cells.each { |cell| cell.occupier = nil }
    end

    def get_previous_moves
        moves = {"X" => [], "O" => []}
        @cells.each do |cell|
            if cell.occupier == "X"
                moves["X"].push(cell.number)
            elsif 
                cell.occupier == "O"
                moves["O"].push(cell.number)
            end
        end
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
        row_results = []
        @rows.each do |row| 
            row_results.push(row.get_three_in_a_row)
        end
        if row_results.include? "X"
            return "X"
        elsif row_results.include? "O"
            return "O"
        else
            return nil
        end
    end
end