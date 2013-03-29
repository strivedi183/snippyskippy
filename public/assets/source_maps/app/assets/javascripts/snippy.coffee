class Snippy
  @document_ready: ->
    Snippy.wookmark()

  @wookmark: ->
    $('#container').wookmark({offset: 2})


$(document).ready(Snippy.document_ready)


# -- closes drop down menu by clicking outside the field -- #

$(document).click (e) ->
  e.stopPropagation()
  container = $(".f-dropdown")
  $("#drop").hide()  if container.has(e.target).length is 0

# -- end -- #
