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

      onDelete: (values) ->
        #console.log values

      onItemAdd: (value, $item) ->
        tags = $("section.tags .tag")
        found = false
        for tag in tags
          found = true if $(tag).html().trim() == value.trim()
        if false == found
          $("section.tags").append("<span class='tag label label-default'>#{value}</span>")

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
          return

        success: (res) ->
          return

  selectize()

  $(document).on 're-selectize', ->
    selectize()

  $(".selectize-input").on 'focusin', ->
    $(this).addClass('selected')

  $(".selectize-input").on 'focusout', ->
    $(this).removeClass('selected')
