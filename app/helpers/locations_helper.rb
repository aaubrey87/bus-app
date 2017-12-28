module LocationsHelper
    
    def fetch_buses_from_api(api_url)
        http_response = Net::HTTP.get_response(URI.parse(api_url))
        bus_list = http_response.body
        
        JSON.parse(bus_list)
    end
    def is_nearby?(user_lat,user_long,bus_lat, bus_long)
        max_distance = 0.01
        
        difference_latitudes = user_lat - bus_lat.to_f
        difference_longitudes = user_long - bus_long.to_f
        
        distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
        
        distance <= max_distance
    end
    
end
