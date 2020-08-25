class DashboardController < ApplicationController

  require 'open-uri'
  include DashboardHelper

  def index
    @countries = JSON.load( open("https://raw.githubusercontent.com/russ666/all-countries-and-cities-json/6ee538beca8914133259b401ba47a550313e8984/countries.min.json") )
    ip_address = request.remote_ip == '::1' ? '2806:104e:17:4ab1:bdf4:7fec:9687:8783' : request.remote_ip
    location   = Geocoder.search(ip_address)#Geocoder.search('192.168.1.70') #? 
    city       = location.first.city ? location.first.city : 'Sao Paulo,BR'
    @weather   = x_get_city_weather(city)
  end


end
