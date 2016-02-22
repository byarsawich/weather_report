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

#   def get_hurricane
#     JSON.parse(File.read('./mock_hurricane.json'))
#   end
#
#   def get_forecast
#     JSON.parse(File.read('./mock_forecast.json'))
#   end



class WeatherReportTest < Minitest::Test
  def test_classes_exist
    assert Condition
    assert ForecastDay
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

end
