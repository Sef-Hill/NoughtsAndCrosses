require 'pry'
require_relative 'console'
require_relative './model/game_coord'

class NoughtsAndCrosses
    include Console

    def initialize
        @game_coord = GameCoord.new
        @turns = 0
        display_welcome_screen
        get_user_details
    end

    def play
        keep_playing = true
        until keep_playing == false
            loop do
                draw_grid
                break if game_over?
                get_user_turn
                @turns += 1
            end
            keep_playing = play_again?
        end            
    end

    def game_over?
        if @turns == 9
            #run game_is_draw
            return true   
        elsif @turns >= 3
            #check for anybody won?
            #run game_won (tell user who won)
            return true
        else
            return false
        end
    end
end