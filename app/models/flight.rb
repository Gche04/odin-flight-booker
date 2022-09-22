class Flight < ApplicationRecord
    validates :airline, :arrival_airport_id, :departure_airport_id, 
                :flight_time, :flight_duration, presence: true

    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings
end
