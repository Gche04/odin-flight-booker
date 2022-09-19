class Flight < ApplicationRecord
    validates :airline, :arriving_airport_id, :departure_airport_id, 
                :flight_time, :flight_duration, presence: true

    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"
end
