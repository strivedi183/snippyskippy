class Snippy
  @document_ready: ->
    Snippy.wookmark()

  @wookmark: ->
    $('#container').wookmark({offset: 2})


$(document).ready(Snippy.document_ready)