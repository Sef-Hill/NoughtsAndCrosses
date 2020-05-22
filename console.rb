require 'pry'
require_relative 'noughts_and_crosses'

class ConsoleApp

    def initialize
        @game_coord = GameCoord.new
        @turns = 0
        display_welcome_screen
        get_user_details
    end

    def play
        #loop:
        # draw grid with grid number / player symbols
            # check for win (after first 3 turns)
                #run win script
                #exit loop
            # check for full grid (is turns == 9 ?)
                #run draw script
                #exit loop
        # get next player to choose an empty cell
        # end loop
        
        keep_playing = true
        until keep_playing == false
            loop do
                draw_grid
                break if game_over?
                player_takes_turn
            end
            keep_playing = play_again?
        end            
    end

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
        #binding.pry

    end

    def draw_grid
        line_divider = "---+---+---"
        puts ""
        puts " 1 | 2 | 3"
        puts line_divider
        puts " 4 | 5 | 6"
        puts line_divider
        puts " 7 | 8 | 9"
    end

    def game_over?
        return true
    end

    def play_again?
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
end