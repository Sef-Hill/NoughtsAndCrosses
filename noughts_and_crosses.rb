require 'pry'
require_relative 'console'
require_relative './model/game_coord'

class NoughtsAndCrosses
    include Console

    def initialize
        @game_coord = GameCoord.new
        @turns = 0
        display_welcome_screen
    end

    def play
        keep_playing = true
        until keep_playing == false
            loop do
                previous_moves = @game_coord.get_previous_moves
                display_grid(previous_moves)
                break if game_over?
                available_positions = @game_coord.get_available_positions
                user_turn = get_user_turn(available_positions)
                @game_coord.set_user_turn(user_turn)
                @turns += 1
            end
            keep_playing = get_user_plays_again?
        end            
    end

    def game_over?
        if @turns == 9
            display_game_is_draw
            return true   
        elsif @turns >= 3
            winner = @game_coord.get_winner
            if winner
                display_winner(player_number)
            return true
        else
            return false
        end
    end
end