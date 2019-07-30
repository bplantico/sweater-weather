class DailyForecastSummary
  def initialize(day)
    @date = day[:time]
    @summary = day[:summary]
  end

end
