require 'pry'

module TennisCenterGem
   class CLI

        def initialize
            @input = " "
        end 

        def start
            puts "Welcome to the Tennis Center Gem!"
            set_location
            list_tennis_centers
        end

        def set_location
            puts "Please enter your location."
            @location = gets.strip
            TennisCenter.load_by_location(@location)
        end 

        def list_tennis_centers
            TennisCenter.all.each.with_index(1) {|tennis_center, index| puts "#{index}. #{tennis_center.name}"}
        end 

    end     
end 