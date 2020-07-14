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
            while @input != "exit"
                if @input == "back"
                    start
                elsif @input == "list"
                    numbered_tennis_center_list
                elsif valid?
                    puts TennisCenter.find_by_number(@input).get_more_details
                else 
                    puts "Invalid input :#{@input}. Please try again!"
                end 
                ask_for_choice
            end 
            if @input == "exit"
                goodbye
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
                "\n",
                "To see more information about a particular tennis center, input the number and press enter",
                "To see the list of tennis centers again, type 'list'",
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

        def goodbye
            puts "\nThank you for using the Tennis Center Gem! Good luck, play safe, and have fun!"
        end 

    end     
end  