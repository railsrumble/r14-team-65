$ ->
  delay = (->
    timer = 0
    (callback, ms) ->
      clearTimeout timer
      timer = setTimeout(callback, ms)
  )()

  $(".container-fluid").on 'keyup', '#search', ->
    $('section.results').addClass 'waiting'

    $('section.tags > span.tag.selected').removeClass 'selected'

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

  $(".container-fluid").on 'click', "section.tags > span.tag", ->
    $('section.results').addClass 'waiting'

    $('#search').val('')

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

