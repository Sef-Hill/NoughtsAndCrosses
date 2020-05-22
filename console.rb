module Console
    def display_welcome_screen
        puts "\nLet's play Noughts and Crosses!"
    end

    def display_grid(previous_moves)

        #ACTION: replace numbers with users' tokens

        line_divider = "---+---+---"
        puts ""
        puts " 1 | 2 | 3"
        puts line_divider
        puts " 4 | 5 | 6"
        puts line_divider
        puts " 7 | 8 | 9"
    end

    def get_user_turn(available_positions)
        # ask player for valid move i.e. in available_positions
        # return grid number as String
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