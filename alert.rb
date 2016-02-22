require 'httparty'
class Alert
  def initialize(zip_code)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{@zip_code}.json")
  end

  def number_of_alerts
    @response["alerts"].length
  end

  def alerts
    temp_array = @response["alerts"]
    string = ""
    temp_array.each do |a|
      string += "#{a["description"]} until #{a["expires"]}\n"
    end
    string.strip
  end
end
