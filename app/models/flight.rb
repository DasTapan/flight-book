class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"

    scope :get_flight_dates, -> {
        uniq_flight_dates = Flight.order(start: :asc).map {|f| f[:start].strftime("%d-%m-%y")}.uniq
        uniq_flight_dates.map {|ds| [ds,ds]}
    }
end
