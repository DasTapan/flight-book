class BookingsController < ApplicationController
    before_action :set_flight_details, only: [:new]
    before_action :get_booking_details, only: [:show]
    
    def new
        # binding.irb
        @booking = Booking.new
        @passenger_count.times {@booking.passengers.build}
    end

    def create
        flight_id = booking_params[:flight_id]
        @booking = Booking.new(flight_id: flight_id)        
        
        # binding.irb

        booking_params[:passengers_attributes].each do |key,p|
            passenger = Passenger.new(p)
            @booking.passengers << passenger
        end

        if @booking.save
            redirect_to booking_path(@booking)
        else
            flash[:alert] = "something went wrong"
        end
    end
    
    def show
        get_booking_details
    end
    
    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email, :mobile])
    end

    def set_flight_details
        # binding.irb
        flight = Flight.find(params[:booking][:flight])
        @passenger_count = params[:booking][:tickets].to_i
        @departure_airport = flight.departure_airport
        @arrival_airport = flight.arrival_airport
        @start = flight.start
        @flight_id = flight.id
    end

    def get_booking_details
        booking = Booking.find(params[:id])        
        @flight = booking.flight
        @passengers = booking.passengers.select(:name, :email, :mobile)
    end

end