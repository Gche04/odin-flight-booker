class Airport < ApplicationRecord
    validates :airport, presence: true

    has_many :arriving_flights, foreign_key: "arriving_airport_id", class_name: "Flight"
    has_many :departing_flights, foreign_key: "departure_airport_id", class_name: "Flight"
end
