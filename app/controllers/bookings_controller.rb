class BookingsController < ApplicationController

    def new
        @flight = Flight.find(params[:flight])
        #@flight_id = params[:flight]#.to_i
        @booking = @flight.bookings.build
        #@booking = Booking.new
        @passenger_num = params[:passenger_num].to_i
        @passenger_num.times { @booking.passengers.build }
    end

    def create
        #flight = Flight.find(params[:flight].to_i)
        #@booking = flight.bookings.create(booking_params)
        @booking = Booking.create(booking_params)
        flash[:error] = @booking.errors.full_messages.to_sentence
        #@booking = Booking.new booking_params

        if @booking.save
            redirect_to @booking
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @booking = Booking.find(params[:id])
        @passengers = @booking.passengers
        @number = Passenger.where(booking_id: params[:id]).count
        @name = "passenger" 
        
        if @number > 1
            @name = "passengers"
        end
    end
end

private
def booking_params
    params.require(:booking).permit(:flight_id,
        passengers_attributes: [ :id, :name, :email ])#:_destroy , :booking_id
end