module TennisCenterGem
    class TennisCenter
        attr_accessor :name, :url, :review_count, :rating, :location, :display_phone, :id
        @@all = []

        def initialize(attributes = {})
            attributes.each do |attribute_name, value| 
                if self.respond_to?("#{attribute_name}=")
                    self.send(("#{attribute_name}="), value)
                end 
            end   
        end 

        def self.load_by_location(location)
            search_results = API.yelp_search("Tennis Center", location)
            @@all = create_from_API_results(search_results)
        end 

        def self.create_from_API_results(search_results)
            search_results.collect do |tennis_center_hash|
                TennisCenter.new(tennis_center_hash)
            end 
        end 

        def self.all
            @@all
        end 

        def self.find_by_number(input)
            self.all[input.to_i - 1]
        end 

        def get_more_details
             <<-HEREDOC

             The #{self.name} has #{self.review_count} reviews and a #{self.rating} rating.
             They are located at #{self.address}.
             To contact #{self.name} directly, call them at #{self.display_phone}.

            HEREDOC
        end
        
        def address
            location["display_address"].join(", ")
        end 

    end 
end 

#pretend number is 1
 
# CLI.search

# CLI.input 
