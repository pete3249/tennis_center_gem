module TennisCenterGem
    class TennisCenter
        attr_accessor :name, :url, :rating, :location, :phone_number, :id
        @@all = []

        def initialize

        end 

        def self.load_by_location(location)
            search_results = API.yelp_search("Tennis Center", location)
            create_from_API_results(search_results)
        end 

        def self.create_from_API_results(search_results)
            
        end 




        def new_from_api_data(t, index)
            self.new(
                new_hash["businesses"][index]["name"],
                new_hash["businesses"][index]["url"],
                new_hash["businesses"][index]["rating"],
                new_hash["businesses"][index]["location"]["address1"],
                #phone_number,
                #id
                #not sure if index is needed or can just use #each
            )
        end 
        
        
        # def initialize(name = nil, url = nil, rating = nil, location = nil, phone_number = nil, id = nil)
        #     @name = name
        #     @url = url
        #     @rating = rating
        #     @location = location
        #     @phone_number = phone_number
        #     @id = id
        #     @@all << self
        # end 

        def display_tennis_center_from_number(number)

        end 


         




        def self.make_tennis_centers
            yelp_search.each.with_index do |t, index|
                TennisCenter.new_from_api_data(t, index)
            end 
        end 
        
    end 
end 