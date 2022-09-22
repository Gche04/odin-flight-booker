class FlightsController < ApplicationController
    def index
        @departure_airport = Airport.all.map{ |f| [ 
            f.airport, 
            f.id 
        ] }

        @arrival_airport = Airport.all.map{ |f| [ 
            f.airport, 
            f.id 
        ] }

        @passengers = passengers(4)

        @date = Flight.all.map{ |f| [ 
            f.flight_time.strftime("%m/%d/%Y"), 
            f.flight_time 
        ] }

        
        date = Date.parse(params[:time])
        @flights = Flight.where(
            departure_airport_id:params[:departure_airport_id],
            arrival_airport_id:params[:arrival_airport_id],
            flight_time:date.beginning_of_day..date.end_of_day
        )

        @passenger_num = params[:passenger]
        @available = available?
    end

    private

    def passengers(num)
        arr = []
        i = 1
        while arr.length < num
            arr << [i]
            i += 1
        end
        arr
    end

    def available?
        return true if @flights.count >= 1
    end
end
