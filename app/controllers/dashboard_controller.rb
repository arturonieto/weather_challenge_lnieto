class DashboardController < ApplicationController

  require 'open-uri'
  include DashboardHelper

  def index
    @cities    = JSON.parse( File.read("cities.json") ).uniq
    ip_address = request.remote_ip == '::1' ? '2806:104e:17:4ab1:bdf4:7fec:9687:8783' : request.remote_ip
    location   = Geocoder.search(ip_address)#Geocoder.search('192.168.1.70') #? 
    city       = location.first.city ? location.first.city : 'Sao Paulo,BR'
    @weather   = get_city_weather(city)
  end

  def _get_city_weather
    city_name = params[:city_name]
    weather   = get_city_weather('blacacaca')#city_name)

    render json: weather
  end

  private

end
