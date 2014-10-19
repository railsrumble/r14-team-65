$ ->
  $(".gist-tag").selectize
    delimiter: ","
    persist: false
    valueField: 'name'
    labelField: 'name'
    searchField: ['name']
    create: true
    render:
      item: (item, escape) ->
        "<div class='tag'><span class='icon icon-book-close'></span>#{escape(item.name)}</div>"

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
