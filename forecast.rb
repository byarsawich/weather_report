class Forecast
  def initialize(zip_code)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip_code}.json")
  end

  def get_forecast
    forecasts = @response["forecast"]["txt_forecast"]["forecastday"]
    string = ""
    forecasts.each do |f|
      string += "#{f["title"]}: #{f["fcttext"]}\n"
    end
    string.chomp
  end
end
