require 'pry'

module TennisCenterGem
   class CLI
        def start
            puts "Welcome to the Tennis Center Gem!"
            puts "Please enter your location."
            @location = gets.strip
            TennisCenter.load_by_location(@location)
        end 

    end     
end 




    # def display
    #     print_tennis_centers
    #     puts "Which Tennis Center would you like more information on?"
    #     input = gets.strip
    # end 
