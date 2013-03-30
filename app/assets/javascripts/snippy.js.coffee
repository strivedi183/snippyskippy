class Snippy
  @document_ready: ->
    Snippy.video_hover()
    $(".draggable").draggable(snap: ".style")
    $(".droppable").droppable({drop: Snippy.tile_droppable})

  @tile_droppable: (e, ui) ->
    $(this).addClass("background-yellow")

  @video_hover: ->
    $('video').prop('muted',true).hover (->
      $(this).css "opacity", "1"
      @play()
    ), ->
      $(this).css "opacity", "1"
      @pause()




$(document).ready(Snippy.document_ready)



# -- closes drop down menu by clicking outside the field -- #

$(document).click (e) ->
  e.stopPropagation()
  container = $(".f-dropdown")
  $("#drop").hide()  if container.has(e.target).length is 0
  # $("#email").val ""
  # $("#password_field").val ""

# -- end -- #

