module TennisCenterGem
    class API
        API_HOST = "https://api.yelp.com"
        SEARCH_PATH = "v3/businesses/search"

        SEARCH_LIMIT = 10
    end 

    #get the key
    def self.api_key
        begin
            #store key in a hidden file that is not in the repo
            #try to open it
            @@key = File.open(File.expland_path("~/.yelp-api-key")).read.strip
        rescue
            puts "Looks like you haven't added your Yelp API key yet. You can get your API key at https://www.yelp.com/developers/documentation/v3/authentication."
            @@key = gets.strip
            File.open(File.expland_path("~/.yelp-api-key"), "w") do |file|
                file.print @@key
            end 
        end 
    end 

    #returns parsed JSON object of request
    def self.yelp_search(term = "Tennis Centers", location = "Atlanta")
        url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
            term: term
            location: location
            limit: SEARCH_LIMIT
        }
        response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
        response.parse
    end 

    def self.get_tennis_centers

    end 
end 


# Client ID
# tTztigtwyIuL7IAPHheVlw

# API Key
# pbgeQNwvUwZdArwup6lb9O2KafaptiPz6jvp0F3jqsUw0VMIK7JGPLFSCOAD5PMluQfu4-uikIxtDyYY3EHDqoD_FNeosZWNHsXYnLP3egTxpILciJt6rsDN32oIX3Yx