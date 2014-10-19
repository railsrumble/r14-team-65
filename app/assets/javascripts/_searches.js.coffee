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
        url: '/searches/'
        type: "POST"
        dataType: 'script'
        data:
          query: @.value
        success: ->
          $(document).trigger 're-selectize'
      )
    ), 500

  $("section.tags").on 'click', "> span.tag", ->
    $(@).toggleClass 'selected'
    texts = []
    $(@).parent().find('.selected').each ->
      texts.push( $(@).text().trim() )
    $.ajax(
      url: '/searches/'
      type: "POST"
      dataType: 'script'
      data:
        query: texts
        type: 'tag'
      success: ->
        $(document).trigger 're-selectize'
    )

