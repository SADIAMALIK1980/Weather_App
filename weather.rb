require 'rubygems'
require 'yahoo_weatherman'

def my_weather(location)

client = Weatherman::Client.new

weather = client.lookup_by_location(location).condition['text']

current_condition = case weather
when "Fair"
  "Its Fair!"
when 'Sunny'
  "Its Sunny!"
when 'Partly Cloudy'
  "Its partly cloudy!"
when 'Cloudy'
  "crazy cloudy!"
when 'Rainy'
  "crazy rainy!"
when 'Snowy'
  "snowy!"
end

puts current_condition

weather = client.lookup_by_location(location)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end

puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
end

end

puts "Please enter your city, state or zip."
location = gets.chomp

my_weather(location)