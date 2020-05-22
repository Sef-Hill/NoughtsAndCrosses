#require 'pry'
require_relative 'noughts_and_crosses'

class ConsoleApp

    def initialize
        @game_coord = GameCoord.new
        display_welcome_screen
        get_user_details
        draw_grid
    end

    def display_welcome_screen
        puts "\nLet's play Noughts and Crosses!"
    end

    def get_user_details
        puts "\nPlease enter name for Player 1:"
        player1 = gets.chomp
        @game_coord.set_first_player_name(player1)

        puts "Now enter name for Player 2:"
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
end