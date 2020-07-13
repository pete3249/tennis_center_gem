module TennisCenterGem
    class TennisCenter
        attr_accessor :name, :url, :rating, :location, :display_phone, :id
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

        def get_more_details
            
        end 

    end 
end 