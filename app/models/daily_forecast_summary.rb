class DailyForecastSummary

  attr_reader :date,
              :summary

  def initialize(day)
    @date    = day[:time]
    @summary = day[:summary]
  end

end
