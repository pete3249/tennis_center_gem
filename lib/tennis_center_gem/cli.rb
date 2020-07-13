require 'pry'

module TennisCenterGem
   class CLI
    attr_accessor :input

        def initialize
            @input = " "
        end 

        def start
            puts [
                "Welcome to the Tennis Center Gem!",
                "We are here to help you find a tennis facility!"
            ]
            get_location
            numbered_tennis_center_list
            ask_for_choice
            while @input != "exit" && @input != "back"
                if valid?
                    # TennisCenter.get_more_details(@input)
                else 
                    puts "Invalid input :#{@input}. Please try again!"
                    ask_for_choice
                end 
            end 
        end 

        def get_location
            puts "Please enter your location."
            @location = gets.strip
            TennisCenter.load_by_location(@location)
        end 

        def numbered_tennis_center_list
            TennisCenter.all.each.with_index(1) {|tennis_center, index| puts "#{index}. #{tennis_center.name}"}
        end 

        def list_choices
            puts [
                "To see more information about a tennis center, input the number and press enter",
                "To search a new location, type 'back'",
                "To end the program, type 'exit'"
            ]
        end 
        
        def ask_for_choice
            list_choices
            @input = gets.strip 
        end 

        def valid?
            @input.to_i.between?(1, TennisCenter.all.length)
        end 

    end     
end  