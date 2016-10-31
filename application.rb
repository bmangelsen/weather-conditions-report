require './alerts'
require './astronomy'
require './conditions'
require './ten_day_forecast'
require 'pry'

puts "Please enter your desired zip code"
zip_code = gets.chomp

conditions = Conditions.new.get(zip_code)
alerts = Alerts.new.get(zip_code)
astronomy = Astronomy.new.get(zip_code)
ten_day_forecast = TenDayForecast.new.get(zip_code)

puts "You chose: #{conditions['current_observation']['display_location']['full']}"
puts "="*20
puts "Current condition: #{conditions['current_observation']['weather']}"
puts "Temperature(F): #{conditions['current_observation']['temp_f']}"
puts "Wind MPH: #{conditions['current_observation']['wind_mph']}"
puts "Wind direction: #{conditions['current_observation']['wind_dir']}"
puts "="*20
puts "Ten day forecast:"
  ten_day_forecast['forecast']['txt_forecast']['forecastday'].each do |el|
  p el['title'] + ": " + el['fcttext']
  end
puts "="*20
puts "Sunrise: #{astronomy['moon_phase']['sunrise']['hour']}:#{astronomy['moon_phase']['sunrise']['minute']}"
puts "Sunset: #{astronomy['moon_phase']['sunset']['hour']}:#{astronomy['moon_phase']['sunset']['minute']}"
puts "="*20
puts "Current weather alerts:"
  alerts['alerts'].each do |el|
  p el['description']
  end
