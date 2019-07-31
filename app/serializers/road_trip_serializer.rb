class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :summary, :temperature, :est_travel_time

end
