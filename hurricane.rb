class Hurricane
  def initialize(zip_code)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/q/#{@zip_code}.json")
  end

  def get_hurricanes
    hurricanes = @response["currenthurricane"]
    string = ""
    return string if hurricanes.empty?
    hurricanes.each do |h|
        string += "Storm Name: #{h["stormInfo"]["stormName_Nice"]}\n"
        string += "Category: #{h["Current"]["SaffirSimpsonCategory"]}\n"
        string += "Wind Speed: #{h["Current"]["WindSpeed"]["Mph"]}mph\n"
        string += "Current Location: #{h["Current"]["lat"]}, #{h["Current"]["lon"]}\n"
        string += "Speed: #{h["Current"]["Fspeed"]["Mph"]}mph to the #{h["Current"]["Movement"]["Text"]}\n"
    end
    string.chomp
  end
end
