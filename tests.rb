# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require './weather_report'

class Condition
  def initialize
    @response = JSON.parse(File.read('./mock_conditions.json'))
  end
end

class Astronomy
  def initialize
    @response = JSON.parse(File.read('./mock_astronomy.json'))
  end
end

class Alert
  def initialize
    @response = JSON.parse(File.read('./mock_alerts.json'))
  end
end

class Forecast
  def initialize
    @response = JSON.parse(File.read('./mock_forecast.json'))
  end
end

#   def get_hurricane
#     JSON.parse(File.read('./mock_hurricane.json'))
#   end



class WeatherReportTest < Minitest::Test
  def test_classes_exist
    assert Condition
    assert Forecast
    assert Astronomy
    assert Alert
    assert Hurricane
  end

  def test_create_condition_and_return_data
    c = Condition.new
    assert_equal "60.7 F (15.9 C)", c.temperature
    assert_equal "San Francisco, CA", c.location
  end

  def test_create_astronomy_and_return_data
    a = Astronomy.new
    assert_equal "6:54", a.sunrise
    assert_equal "18:02", a.sunset
  end

  def test_create_alerts_and_return_data
    a = Alert.new
    assert_equal 2, a.number_of_alerts
    assert_equal "Wind Advisory until 8:00 PM MST on February 22, 2016\nFire Weather Warning until 7:00 PM MST on February 22, 2016", a.alerts
  end

  def test_create_forecast_and_display_10_day_forecast
    f = Forecast.new
    assert_equal forecasts, f.get_forecast
  end

  private def forecasts
    %Q{Monday: Sunshine and clouds mixed. High 68F. Winds NW at 5 to 10 mph.
Monday Night: A few passing clouds. Low around 50F. Winds light and variable.
Tuesday: Partly cloudy. High 68F. Winds light and variable.
Tuesday Night: Partly cloudy skies. Low around 50F. Winds light and variable.
Wednesday: Mostly sunny skies. High 69F. Winds N at 5 to 10 mph.
Wednesday Night: Mostly clear. Low 52F. Winds light and variable.
Thursday: Mainly sunny. High near 70F. Winds NW at 5 to 10 mph.
Thursday Night: Generally fair. Low 52F. Winds light and variable.
Friday: Partly cloudy. High around 65F. Winds WSW at 10 to 15 mph.
Friday Night: Mostly cloudy skies early with showers developing late. Low 53F. Winds light and variable. Chance of rain 40%.
Saturday: A few clouds from time to time. High 63F. Winds W at 10 to 15 mph.
Saturday Night: Generally fair. Low 51F. Winds WSW at 5 to 10 mph.
Sunday: Partly cloudy skies. High near 65F. Winds SW at 5 to 10 mph.
Sunday Night: Partly cloudy. Low 52F. Winds WSW at 5 to 10 mph.
Monday: Intervals of clouds and sunshine in the morning with more clouds for later in the day. High 64F. Winds W at 10 to 15 mph.
Monday Night: Partly cloudy skies in the evening, then becoming cloudy overnight. Low 52F. Winds light and variable.
Tuesday: Cloudy skies early will become partly cloudy later in the day. High 68F. Winds light and variable.
Tuesday Night: Cloudy with showers. Low 53F. Winds light and variable. Chance of rain 40%.
Wednesday: Cloudy with occasional rain showers. High near 65F. Winds S at 5 to 10 mph. Chance of rain 40%.
Wednesday Night: Cloudy with occasional rain showers. Low 53F. Winds light and variable. Chance of rain 60%.}
  end
end
