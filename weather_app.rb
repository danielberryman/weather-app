require 'barometer'

def get_location
    puts 'What is you zipcode?'
    zipcode = gets
end

barometer = Barometer.new(get_location)
weather = barometer.measure
weather = weather.forecast

predictions = weather.instance_variable_get(:@predictions)

predictions.each do |item|
    dayofweek = item.starts_at.strftime("%A")
    t = Time.now
    today = t.strftime("%A")
    t2 = t + (60 * 60 * 24)
    tomorrow = t2.strftime("%A")
    if dayofweek == today
        puts "Today is going to be #{item.icon} with a low of #{item.low} and a high of #{item.high} degrees celsius."
    elsif dayofweek == tomorrow
        puts "Tomorrow is going to be #{item.icon} with a low of #{item.low} and a high of #{item.high} degrees celsius."
    else
        puts "#{dayofweek} is going to be #{item.icon} with a low of #{item.low} and a high of #{item.high} degrees celsius."
    end
end
