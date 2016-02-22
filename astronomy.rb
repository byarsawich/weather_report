class Astronamy
  attr_reader :sunrise_hour, :sunrise_minutes, :sunset_hour, :sunset_minutes
  def initialize(response)
    @sunrise_hour = response[:sun_phase][:sunrise][:hour]
    @sunrise_minutes = response[:sun_phase][:sunrise][:minute]
    @sunset_hour = response[:sun_phase][:sunset][:hour]
    @sunset_minutes = response[:sun_phase][:sunrise][:minute]
  end
end
