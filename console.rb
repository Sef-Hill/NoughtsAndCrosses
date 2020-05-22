module Console
    def display_welcome_screen
        puts "\nLet's play Noughts and Crosses!"
    end

    def get_user_details
        puts "\nPlease enter name for Player 1:"
        player1 = gets.chomp
        @game_coord.set_first_player_name(player1)

        puts "\nNow enter name for Player 2:"
        player2 = gets.chomp
        @game_coord.set_second_player_name(player2)
    end

    def display_grid

        #ACTION: replace numbers with user symbols

        line_divider = "---+---+---"
        puts ""
        puts " 1 | 2 | 3"
        puts line_divider
        puts " 4 | 5 | 6"
        puts line_divider
        puts " 7 | 8 | 9"
    end

    def get_user_turn
        # ask player for valid grid number
        # send data to @game_coord
    end

    def user_plays_again?
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

    def display_game_is_draw
        puts "\nIt's a draw - bad luck!"
    end
end