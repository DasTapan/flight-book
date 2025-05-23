# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

AIRPORTS = [
    {code: "DEL", city: "New Delhi"},
    {code: "MUM", city: "Mumbai"},
    {code: "KOL", city: "Kolkata"},
    {code: "CHN", city: "Chennai"},
    {code: "HYD", city: "Hyderabad"},
    {code: "PUN", city: "Pune"},
    {code: "CHG", city: "Chandigarh"},
    {code: "BLR", city: "Bangalore"},
    {code: "LKN", city: "Lucknow"},
    {code: "BBSR", city: "Bhubaneswar"}
]

AIRPORTS.each do |a|
    Airport.find_or_create_by!(a)
end

AIRPORTS.each do |item|
    AIRPORTS.each do |i|
        next if item[:code] == i[:code]
        random_hours_one = rand(-10..5)
        random_hours_two = rand(-10..5)
        random_hours_three = rand(-10..5)
        random_hours_four = rand(-10..5)
        random_hours_five = rand(-10..5)
        random_hours_six = rand(-10..5)

        (0..7).each do |n|
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_one.hours, duration: (rand(45..90)) * 60
            })
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_two.hours, duration: (rand(45..90)) * 60
            })
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_three.hours, duration: (rand(45..90)) * 60
            })
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_four.hours, duration: (rand(45..90)) * 60
            })
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_five.hours, duration: (rand(45..90)) * 60
            })
            Flight.find_or_create_by!({
                departure_airport_id: Airport.find_by(code: item[:code]).id, arrival_airport_id: Airport.find_by(code: i[:code]).id, start: DateTime.now + n.days + random_hours_six.hours, duration: (rand(45..90)) * 60
            })
        end
    end
end