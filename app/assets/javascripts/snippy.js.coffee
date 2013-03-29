class Snippy
  @document_ready: ->
    Snippy.video_hover()
    Snippy.run_wookmark()

  @video_hover: ->
    $('video').hover (->
      $(this).css "opacity", "1"
      @play()
    ), ->
      $(this).css "opacity", "1"
      @pause()

  @run_wookmark: ->
    options =
        autoResize: true
        offset: 1
        itemWidth: 200
        container: $('#main')
    handler = $('#tiles li')
    handler.wookmark(options)


$(document).ready(Snippy.document_ready)
