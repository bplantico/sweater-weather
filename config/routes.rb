Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        get '/forecast', to: 'forecast#show'
        get '/backgrounds', to: 'backgrounds#index'
        get '/munchies', to: 'munchies#index'
        get '/gifs', to: 'gifs#index'
    end
  end
end

# /api/v1/gifs?location=denver,co
