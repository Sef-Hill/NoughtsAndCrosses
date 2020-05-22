require_relative 'noughts_and_crosses'

class ConsoleApp
    

    def initialize
        display_welcome_screen
        get_user_details
    end

    def display_welcome_screen
        puts "Hello. This is going to be a Welcome Screen!"
    end

    def get_user_details
        puts "This is where you'll tell me who you are..."
    end
end