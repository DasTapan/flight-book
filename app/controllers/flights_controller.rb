class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map {|a| [a.city, a.id]}
    @flight_dates = Flight.get_flight_dates
  end
end
