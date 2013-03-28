class Snippy
  @document_ready: ->
    Snippy.wookie()

  @wookie: ->
    $('.mustache').wookmark({ itemWidth: 50, offset: 2, container: $('#container'), autoresize: true, align: 'center' })


$(document).ready(Snippy.document_ready)