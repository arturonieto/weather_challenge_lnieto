Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  get '/_get_city_weather' => 'dashboard#_get_city_weather'
end
