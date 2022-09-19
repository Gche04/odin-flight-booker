# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all

airports = Airport.create([
    { airport: "LAG" },
    { airport: "OGN" }, 
    { airport: "IMO" }, 
    { airport: "ABJ" }, 
    { airport: "ABA" }
])

flights = Flight.create([
    {
        airline: "aa"
        arrival_airport_id: Airport.find_by(airport: "LAG").id,
        departure_airport_id: Airport.find_by(airport: "ABA").id,
        flight_time: 2019, 8, 10, 4, 10, 0,
        flight_duration: "2 hours"
    }
    {
        airline: "bb"
        arrival_airport_id: Airport.find_by(airport: "IMO").id,
        departure_airport_id: Airport.find_by(airport: "ABJ").id,
        flight_time: 2020, 8, 11, 1, 10, 0,
        flight_duration: "3 hours"
    }
    {
        airline: "cc"
        arrival_airport_id: Airport.find_by(airport: "OGN").id,
        departure_airport_id: Airport.find_by(airport: "IMO").id,
        flight_time: 2021, 8, 11, 1, 10, 0,
        flight_duration: "3 hours"
    }
])
