Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        get '/forecast',    to: 'forecast#show'
        get '/backgrounds', to: 'backgrounds#index'
        get '/munchies',    to: 'munchies#index'
        get '/gifs',        to: 'gifsforecast#index'
        post '/users',      to: 'users#create'
        post '/sessions',   to: 'sessions#create'
        post '/road_trip',   to: 'roadtrip#show'
    end
  end
end

# [POST] "/api/v1/road_trip"
