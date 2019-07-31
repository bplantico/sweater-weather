class RoadTripForecast
  attr_reader :id,
              :summary,
              :temperature,
              :est_travel_time

  def initialize(full_forecast, trip_duration)
    @id          = full_forecast[:currently][:time].to_s + '_' + full_forecast[:currently][:uvIndex].to_s
    @summary     = full_forecast[:currently][:summary]
    @temperature = full_forecast[:currently][:temperature]
    @est_travel_time = trip_duration
  end

end
