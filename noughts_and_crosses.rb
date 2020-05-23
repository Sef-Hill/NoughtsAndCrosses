require_relative 'console'
require_relative 'game_coord'

class NoughtsAndCrosses
    include Console

    TOKENS = {1 => "X", 2 => "O"}

    def initialize
        @game_coord = GameCoord.new
        @turn = 1
        @player_number = 1
        display_welcome_screen
    end

    def play
        keep_playing = true
        until keep_playing == false
            loop do
                draw_board
                available_positions = @game_coord.get_available_positions
                chosen_position = get_user_turn(@player_number, TOKENS[@player_number], available_positions)
                @game_coord.set_user_turn(TOKENS[@player_number], chosen_position)

                break if game_over?

                @turn += 1
                if @player_number == 1
                    @player_number = 2
                else
                    @player_number = 1
                end
            end
            keep_playing = get_user_plays_again?
            if keep_playing
                @game_coord.reset_board
                @player_number = 1
                @turn = 1
            end
        end            
    end

    def draw_board
        previous_moves = @game_coord.get_previous_moves
        display_grid(previous_moves)
    end

    def game_over?
        game_over = false

        if @turn >= 5
            if @game_coord.get_winner
                draw_board
                display_winner(@player_number, TOKENS[@player_number])
                game_over = true
            elsif @turn == 9
                draw_board
                display_game_is_draw
                game_over = true   
            end
        end
        return game_over
    end
end