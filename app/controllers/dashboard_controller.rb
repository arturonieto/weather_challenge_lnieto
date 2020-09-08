class DashboardController < ApplicationController

  include DashboardHelper

  def index
    @cities    = JSON.parse( File.read('cities.json') ).uniq
    ip_address = request.remote_ip == '::1' ? '2806:104e:17:4ab1:bdf4:7fec:9687:8783' : request.remote_ip
    location   = Geocoder.search(ip_address)
    city       = location.first ? location.first.city : 'Sao Paulo,BR'
    @weather   = get_city_weather(city)
  end

  def _get_city_weather
    city_name = params[:city_name]
    weather   = get_city_weather(city_name)

    render json: weather
  end

  def get_fav_cities
    favorite_cities = FavoriteCity.all.order("id DESC")
    @favorite_weathers = []
    favorite_cities.each do |fav_city|
      @favorite_weathers.push get_city_weather(fav_city.name)
    end
    render partial: "favorite_cities"
  end

  def add_city_to_favorites
    city_name = params[:city_name]
    return if FavoriteCity.exists?(name: city_name)
    FavoriteCity.create( { name: city_name } )
  end

  def remove_city_from_favorites
    FavoriteCity.where( city_params ).destroy_all
  end

  def api_forecast
    _get_city_weather()
  end

  private

  def city_params
    params.permit(:name)
  end

end
