class Snippy
  @document_ready: ->
    Snippy.video_hover()

  @video_hover: ->
    $('video').prop('muted',true).hover (->
      $(this).css "opacity", "1"
      @play()
    ), ->
      $(this).css "opacity", "1"
      @pause()


$(document).ready(Snippy.document_ready)
