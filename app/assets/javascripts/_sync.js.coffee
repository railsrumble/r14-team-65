$ ->
  $('.sync_button').click (e) ->
    $('.overlay').slideDown 1000
    $(@).parent().addClass 'disabled'
