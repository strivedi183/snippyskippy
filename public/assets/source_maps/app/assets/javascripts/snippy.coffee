class Snippy
  @document_ready: ->
    Snippy.wookie()

  @wookie: ->
    $('.mustache').wookmark()


$(document).ready(Snippy.document_ready)
