$ ->
  console.log('DOM ready')
  $('.city_searcher input').keypress ->
    console.log(this.value);
