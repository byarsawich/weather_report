require 'httparty'
class Condition
  def initialize(zip_code)
   @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip_code}.json")
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end

  def temperature
    @response["current_observation"]["temperature_string"]
  end
end
