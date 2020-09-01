$ ->

  available_countries = $('.city_searcher_x').data('available-countries')

  $('.favorite_cities').load '/dashboard/get_fav_cities'

  $(document).on 'ajax:success', ->
    $('.favorite_cities').load '/dashboard/get_fav_cities'

  $('.add_to_fav').on 'click', ->
    city_name = $('#name').val()
    $.ajax '/add_city_to_favorites',
      type: 'POST'
      data: { city_name: city_name }
      error: ->
        $('.city_name').hide()
        $('.city_name').html('City not added ERR').css('color', 'red')
        $('.city_name').fadeIn(1000)
      success: (data) ->
        $('.favorite_cities').load '/dashboard/get_fav_cities'
        $('.add_to_fav_form').hide()

  $('.city_searcher_x').autocomplete
    source: available_countries,
    minLength: 3
    autoFocus: true
    select: (event, ui) ->
      $.ajax '/_get_city_weather',
        type: 'GET'
        data: { city_name: ui.item.value }
        error: ->
          $('.city_name').hide()
          $('.city_name').html('Not found').css('color', 'red')
          $('.city_name').fadeIn(1000)
        success: (data) ->
          $('.dashboard_index .current_city').hide()
          $('.city_name').html(data.city_and_country).css('color', 'black')
          $('.city_temperature').html(data.city_weather.temperature)
          $('.city_temperature_f').html(data.f_temperature.temperature)
          $('.pressure').html(data.city_weather.pressure + ' hpa')
          $('.humidity').html(data.city_weather.humidity + ' %')
          $('.max_celcius').html(data.city_weather.max_temperature + ' ºC')
          $('.min_celcius').html(data.city_weather.min_temperature + ' ºC')
          $('.max_farenheit').html(data.f_temperature.max + ' ºF')
          $('.min_farenheit').html(data.f_temperature.min + ' ºF')
          $('.wind_speed').html(data.city_weather.wind_speed + ' km/h')
          $('.current_city input[name=name]').val(data.city_and_country)
          $('.dashboard_index .current_city').fadeIn( 1000 )
          if !data.is_fav
            $('.add_to_fav_form').show()
          else 
            $('.add_to_fav_form').hide()

