class Api::V1::ForecastController < ApplicationController

  def show
    city_state = forecast_params[:location].split(',')
    city = city_state[0]
    state_abbreve = city_state[1]
require "pry"; binding.pry
    
  end

  private

  def forecast_params
    params.permit(:location)
  end

end
