module TennisCenterGem
   class CLI
    
        def start
            puts [
                "Welcome to the Tennis Center Gem!".colorize(:magenta),
                "\nWe are here to help you find a tennis facility!".colorize(:magenta)
            ]
            while @input != "exit"
                get_location
                start_tennis_center_operator
            end 
        end 

        def get_location
            puts "\nPlease enter a location.".colorize(:light_blue)
            @location = gets.strip
            TennisCenter.load_by_location(@location) unless @location == "exit"
        end 

        def start_tennis_center_operator
            numbered_tennis_center_list
            ask_for_choice
                while @input != "exit" && @input != "back"
                    #binding.pry if @input == "debug"
                    if @input == "list"
                        numbered_tennis_center_list
                    elsif valid?
                        puts TennisCenter.find_by_number(@input).get_more_details
                    else 
                        puts "Invalid input :#{@input}. Please try again!".colorize(:red)
                    end 
                    ask_for_choice
                end 
            if @input == "exit"
                goodbye
            end 
        end 

        def numbered_tennis_center_list
            TennisCenter.all.each.with_index(1) {|tennis_center, index| puts "#{index}. #{tennis_center.name}"}
        end 

        def list_choices
            puts [
                "\n",
                "To see more information about a particular tennis center, input the" + " number ".colorize(:light_blue) + "and press enter",
                "To see the list of tennis centers again, type" + " 'list'".colorize(:light_blue),
                "To search a new location, type" + " 'back'".colorize(:light_blue),
                "To end the program, type" + " 'exit'".colorize(:light_blue)
            ]
        end 
        
        def ask_for_choice
            list_choices
            @input = gets.strip.downcase
        end 

        def valid?
            @input.to_i.between?(1, TennisCenter.all.length)
        end 

        def goodbye
            puts "\nThank you for using the Tennis Center Gem! Good luck, play safe, and have fun!".colorize(:magenta)
        end 

    end     
end  