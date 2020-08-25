module DashboardHelper

  def x_get_city_weather(city_name)
    city_weather = Openweather2.get_weather(city: city_name, units: 'metric')
    f_temperature = get_farenheit(city_weather)

    {
      city_weather: city_weather,
      f_temperature: f_temperature
    }
  end 

  def get_farenheit(city_weather)
    {
      min: '%2.f' % ( city_weather.min_temperature * 9/5.to_d + 32 ),
      max: '%2.f' % ( city_weather.max_temperature * 9/5.to_d + 32 ),
      temperature: '%2.f' % ( city_weather.temperature * 9/5.to_d + 32 )
    }
  end
end
