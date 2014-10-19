$ ->
  selectize = () ->

    $(".gist-input-tags").selectize(
      delimiter: ","
      persist: false
      valueField: 'name'
      labelField: 'name'
      searchField: ['name']
      render:
        item: (item, escape) ->
          "<div class='tag'><span class='icon icon-book-close'></span>#{escape(item.name)}</div>"
      create: true

      load: (query, callback) ->
        return callback() unless query.length
        $.ajax
          url: "/tags"
          type: "GET"
          dataType: "json"
          data:
            query: query

          error: ->
            callback()
            return

          success: (res) ->
            callback res
            return

    ).on 'change', (value) ->
      id = $(@).data('gistid')
      taglist = value.currentTarget.value.split(',')

      $.ajax
        url: "/gists/#{id}/updatetags"
        type: "POST"
        dataType: "json"
        data:
          tag_list: taglist

        error: ->
          callback()
          return

        success: (res) ->
          callback res
          return


  selectize()

  $(document).on 're-selectize', ->
    selectize()

  $(".selectize-control").on 'focusin', ->
    $(this).addClass('selected')

  $(".selectize-control").on 'focusout', ->
    $(this).removeClass('selected')
