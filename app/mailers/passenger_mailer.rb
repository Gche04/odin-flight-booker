class PassengerMailer < ApplicationMailer
    default from: 'confirmations@example.com'

    def passenger_mailer
        @passenger = params[:passenger]
        @url  = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Confirmed')
    end
end
