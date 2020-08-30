$ ->
  console.log('DOM ready')
  available_countries = $('.city_searcher_x').data('available-countries')
  $('.city_searcher_x').autocomplete
    source: available_countries,
    minLength: 3
    select: (event, ui) ->
      $.ajax '/_get_city_weather',
        type: 'GET'
        data: { city_name: ui.item.value }
        error: ->
          $('.dashboard_index .current_city').html('Algo fallo mijo')
        success: (data) ->
          $('.dashboard_index .current_city').hide()
          $('.city_name').html(data.city_weather.city)
          $('.city_temperature').html(data.city_weather.temperature)
          $('.city_temperature_f').html(data.f_temperature.temperature)
          $('.pressure').html(data.city_weather.pressure + ' hpa')
          $('.humidity').html(data.city_weather.humidity + ' %')
          $('.max_celcius').html(data.city_weather.max_temperature + ' ºC')
          $('.min_celcius').html(data.city_weather.min_temperature + ' ºC')
          $('.max_farenheit').html(data.f_temperature.max + ' ºF')
          $('.min_farenheit').html(data.f_temperature.min + ' ºF')
          $('.wind_speed').html(data.city_weather.wind_speed + ' km/h')
          $('.dashboard_index .current_city').fadeIn( 1000 )
