#!/usr/bin/env ruby

# ai prompt:
# using ruby, the US Census Data, Google Maps, make a web-site similar to bestneighborhoods.org that overlays what races live where
# TODO: only gets data at a coordinate..?
#   - check the APIs for a more broader set of data, based on the view/zoom of a map
#   - "https://geocoding.geo.census.gov/geocoder/geographies/coordinates?x=#{lng}&y=#{lat}&benchmark=4&vintage=4&format=json"

# TODO: regenerate using sinatra, for a single file server and site

# TODO: un-tested

# To run this code:

# Install Roda: gem install roda
# Save: Save the code as a .rb file (e.g., best_neighborhoods.rb).
# Create views directory: Create a folder called views in the same directory as your ruby file.
# Save erb: Save the erb code as views/index.erb
# Run: Execute the file from your terminal: ruby best_neighborhoods.rb
# Open in Browser: Open your web browser and go to http://localhost:9292.
# Replace API Keys: Replace the placeholder API keys.
# Click on the Map: Click on any point on the map to see the census data for that location.

require 'roda'
require 'json'
require 'net/http'
require 'uri'
require 'erb'

# Replace with your actual API keys
GOOGLE_MAPS_API_KEY = 'YOUR_GOOGLE_MAPS_API_KEY'
CENSUS_API_KEY = 'YOUR_CENSUS_API_KEY'
CENSUS_API_URL = 'https://api.census.gov/data/2020/acs/acs5' # NOTE: 2020?

# returns a hash with the race data of a coordinate
def get_census_data(lat, lng)
  uri = URI("https://geocoding.geo.census.gov/geocoder/geographies/coordinates?x=#{lng}&y=#{lat}&benchmark=4&vintage=4&format=json")
  response = Net::HTTP.get(uri)
  result = JSON.parse(response)

  return {"error" => "County not found"} unless result["result"]["geographies"]["Counties"]

  county_fips = result["result"]["geographies"]["Counties"][0]["GEOID"]

  census_uri = URI("#{CENSUS_API_URL}?get=NAME,B03002_001E,B03002_003E,B02001_002E,B01001_003E,B01001_005E&for=county:#{county_fips}&key=#{CENSUS_API_KEY}")
  census_response = Net::HTTP.get(census_uri)
  census_result = JSON.parse(census_response)

  return {"error" => "Census data not found"} if census_result.length <= 1

  headers = census_result[0]
  data = census_result[1] # body

  {
    "county" => data[headers.index("NAME")], # get the array index of each chunk of data
    "total_population" => data[headers.index("B03002_001E")],
    "hispanic_latino" => data[headers.index("B03002_003E")],
    "white" => data[headers.index("B02001_002E")],
    "black" => data[headers.index("B01001_003E")],
    "asian" => data[headers.index("B01001_005E")]
  }
rescue => e
  puts "Error: #{e.message}"
  {"error" => "An error occurred"}
end

class BestNeighborhoods < Roda
  plugin :render, views: 'views' # checks views folder
  plugin :public, root: 'public'

  route do |r|
    r.root do
      view :index, locals: { google_maps_api_key: GOOGLE_MAPS_API_KEY }
    end

    r.get 'census_data' do # r.get data (coordinates) from the view's.. what?
      lat = r.params['lat'].to_f
      lng = r.params['lng'].to_f

      r.response['Content-Type'] = 'application/json'
      get_census_data(lat, lng).to_json # process it via main function above
        # returns a hash
    end
  end
end

__END__

