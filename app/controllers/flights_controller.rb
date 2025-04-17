class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map {|a| [a.city, a.id]}
    @flight_dates = Flight.get_flight_dates
    @flights = get_flights
  end

  private

  def get_flights
    if flight_params.empty?
      []
    else
      f = Flight.where(departure_airport: flight_params[:departure_airport], arrival_airport: flight_params[:arrival_airport])
      dt = DateTime.strptime(flight_params[:start], "%d-%m-%y")
      _dt = DateTime.strptime("#{flight_params[:start]} 23:59:59", "%d-%m-%y %H:%M:%S")
      # binding.irb
  
      f.where("start >= ? AND start < ?", dt, _dt)
    end
  end

  def flight_params
    params.permit(:departure_airport, :arrival_airport, :passenger_count, :start)
  end  

  def get_search_params
    @selected_departure_airport = params[:departure_airport]
    @selected_arrival_airport = params[:arrival_airport]
    @selected_date = params[:start]
    @selected_passengers_count = params[:passenger_count]
  end
end
