$ ->
  console.log('DOM ready')
  $('.city_searcher input').keyup ->
    console.log(this.value)
