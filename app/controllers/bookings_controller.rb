class BookingsController < ApplicationController

    def new
        @flight = Flight.find(params[:flight])
        @booking = @flight.bookings.build
        @passenger_num = params[:passenger_num].to_i
        @passenger_num.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.create(booking_params)
        flash[:error] = @booking.errors.full_messages.to_sentence

        #if @booking.save
            #redirect_to @booking
            
                respond_to do |format|
                  if @booking.save
                    # Tell the UserMailer to send a welcome email after save
                    passengers = @booking.passengers
                    passengers.each do |passenger|
                        PassengerMailer.with(passenger: passenger).passenger_mailer.deliver_now
                    end
                    
                    format.html { redirect_to(@booking) }
                    format.json { render json: @booking, status: :created, location: @booking }
                  else
                    format.html { render action: 'new' }
                    format.json { render json: @booking.errors, status: :unprocessable_entity }
                  end
                end
        #else
            #render :new, status: :unprocessable_entity
        #end
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
        passengers_attributes: [ :id, :name, :email ])
end