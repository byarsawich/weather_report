require './condition.rb'
require './forecast.rb'
require './astronomy.rb'
require './alert.rb'
require './hurricane.rb'

puts "Enter a zip code:"
zip_code = gets.chomp

condition = Condition.new(zip_code)
forcast = Forecast.new(zip_code)
astronomy = Astronomy.new(zip_code)
alert = Alert.new(zip_code)
hurricane = Hurricane.new(zip_code)
puts "Your current temperature in #{condition.location} is #{condition.temperature}"
puts "Your ten day forcast is:"
puts forcast.get_forecast
puts "The sunrise will be at #{astronomy.sunrise}"
puts "The sunset will be at #{astronomy.sunset}"
puts "The current weather alerts:"
puts alert.alerts
puts "The current hurricanes are:"
puts hurricane.get_hurricanes
