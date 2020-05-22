require 'pry'
require_relative 'console'
require_relative './model/game_coord'

class NoughtsAndCrosses
    include Console

    PLAYERS = {1 => "X", 2 => "O"}

    def initialize
        @game_coord = GameCoord.new
        @turns = 0
        display_welcome_screen
    end

    def play
        keep_playing = true
        player_number = 1

        until keep_playing == false
            loop do
                previous_moves = @game_coord.get_previous_moves
                # returns Hash: e.g.{X => [1, 2, 9], O => [3, 4]}
                display_grid(previous_moves)
                break if game_over?

                available_positions = @game_coord.get_available_positions
                grid_number = get_user_turn(available_positions)
                @game_coord.set_user_turn(PLAYERS[player_number], grid_number)
                @turns += 1
                if player_number == 1
                    player_number = 2
                else
                    player_number = 1
                end
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
            # winner will be "X" or "O" or nil
            if winner
                display_winner(player_number)
                return true
            else
                return false
            end
        else
            return false
        end
    end
end