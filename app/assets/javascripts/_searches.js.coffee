$ ->
  delay = (->
    timer = 0
    (callback, ms) ->
      clearTimeout timer
      timer = setTimeout(callback, ms)
  )()

  $("#search").keyup ->
    delay (=>
      $.ajax(
        url: 'searches/'
        type: "GET"
        dataType: "json"
        data:
          query: @.value
      )
    ), 500
