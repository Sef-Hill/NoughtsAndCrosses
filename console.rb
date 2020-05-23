module Console
    def display_welcome_screen
        puts "\nLet's play Noughts and Crosses!"
    end

    def display_grid(previous_moves)

        #ACTION: replace numbers with users' tokens
        # previous_moves == Hash: e.g.{X => [1, 2, 9], O => [3, 4]}

        grid_symbols = []
        for i in 1..9
            if previous_moves["X"].include? i
                grid_symbols.push("X")
            elsif previous_moves["O"].include? i
                grid_symbols.push("O")
            else
                grid_symbols.push(i)
            end
        end

        line_divider = "---+---+---"
        puts ""
        puts " #{grid_symbols[0]} | #{grid_symbols[1]} | #{grid_symbols[2]}"
        puts line_divider
        puts " #{grid_symbols[3]} | #{grid_symbols[4]} | #{grid_symbols[5]}"
        puts line_divider
        puts " #{grid_symbols[6]} | #{grid_symbols[7]} | #{grid_symbols[8]}"
    end

    def get_user_turn(player_number, player_token, available_positions)
        # available_positions == Array[Integer]
        #RETURNS: Integer

        # ask player for valid move i.e. in available_positions
        valid_input = false
        user_input = 0
        until valid_input
            puts "\nPlayer #{player_number} (#{player_token}): enter a square number"
            user_input = gets.chomp.to_i
            if available_positions.include? user_input
                valid_input = true
            else
                puts "\nPlease enter number of a free space:"
            end
        end
        return user_input
    end

    def get_user_plays_again?
        valid_input = false
        user_input = ""
        until valid_input
            puts "\nPlay again? (y/n):"
            user_input = gets.chomp.downcase
            if user_input == "n" || user_input == "y"
                valid_input = true
            else
                puts "\nPlease enter 'y' or 'n'"
            end
        end
        user_input == "y"
    end

    def display_winner(player_number)
        puts "\nCongrats Player #{player_number}!"
    end

    def display_game_is_draw
        puts "\nIt's a draw - bad luck!"
    end
end