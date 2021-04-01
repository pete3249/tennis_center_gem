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
            results = API.yelp_search("Tennis Center", location = "Atlanta")
            @@all = create_from_API_results(results)
        end 

        def self.create_from_API_results(results)
            results.collect do |tennis_center_hash|
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
            puts [
                "\nThe #{self.name} has #{self.review_count} review(s) and a #{self.rating} rating.",
                "They are located at #{self.address}.",
                "\nTo contact #{self.name} directly, call them at #{self.display_phone}.",
                "\nREVIEWS:",
                "#{self.display_reviews}"
            ]
        end
        
        def address
            location["display_address"].join(", ")
        end
        
        def get_reviews
            @reviews ||= API.get_yelp_reviews(self.id)
        end 

        def display_reviews
            self.get_reviews.map do |review_hash|
                [
                    "Reviewer: #{review_hash['user']['name']}",
                    Date.parse(review_hash['time_created']).strftime("%B %Y"),
                    "Rating: #{review_hash['rating']}",
                    "Review: #{review_hash['text']}",
                    "Keep reading: #{review_hash['url']}",
                    ""
                ].join("\n")
            end.join("\n")
        end 
        
    end 
end 