# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require './weather_report'

require 'httparty'

class Condition
  def initialize
    @response = JSON.parse(File.read('./mock_conditions.json'))
  end
end

#   def get_location
#     JSON.parse(File.read('./mock_conditions.json'))["current_observation"]["display_location"]
#   end
#
#   def get_alerts
#     JSON.parse(File.read('./mock_alerts.json'))
#   end
#
#   def get_astronomy
#     JSON.parse(File.read('./mock_astronomy.json'))
#   end
#
#   def get_hurricane
#     JSON.parse(File.read('./mock_hurricane.json'))
#   end
#
#   def get_forecast
#     JSON.parse(File.read('./mock_forecast.json'))
#   end
# end


class WeatherReportTest < Minitest::Test
  def test_classes_exist
    assert Condition
    assert ForecastDay
    assert Astronamy
    assert Alert
    assert Hurricane
  end

  def test_create_condition_and_return_data
    c = Condition.new
    assert_equal "60.7 F (15.9 C)", c.temperature
    assert_equal "San Francisco, CA", c.location
  end

  def test_create_astronomy

  end

end