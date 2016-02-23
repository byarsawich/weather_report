require 'httparty'
class Astronomy
  def initialize(zip_code)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip_code}.json")
  end

  def sunrise
    "#{@response["sun_phase"]["sunrise"]["hour"]}:#{@response["sun_phase"]["sunrise"]["minute"]}"
  end

  def sunset
    "#{@response["sun_phase"]["sunset"]["hour"]}:#{@response["sun_phase"]["sunset"]["minute"]}"
  end
end
