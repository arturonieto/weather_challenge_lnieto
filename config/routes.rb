Rails.application.routes.draw do
  resources :favorite_cities
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  get '/_get_city_weather'	     => 'dashboard#_get_city_weather'
  get '/api/forecast'	     	     => 'dashboard#api_forecast'
  get '/dashboard/get_fav_cities'    => 'dashboard#get_fav_cities'
  post '/add_city_to_favorites'      => 'dashboard#add_city_to_favorites', 	as: :add_city_to_favorites
  post '/remove_city_from_favorites' => 'dashboard#remove_city_from_favorites', as: :remove_city_from_favorites
end
