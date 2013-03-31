class Snippy
  @document_ready: ->
    Snippy.video_hover()
    $(".draggable").draggable({snap: ".style", zIndex: 9999, revert: "valid", opacity: 0.5, drag: Snippy.get_draggable_info})
    $(".droppable").droppable({drop: Snippy.update_rank})
    # $(".style").on('drop', Snippy.update_rank)
    $('#tiles').on('click', '.favorites', Snippy.update_favorite)

  @get_draggable_info: (e, ui) ->
    Snippy.medium_id = $(this).data('medium-id')
    console.log("The Medium ID is #{Snippy.medium_id}")
    # ui.helper.addClass('drag_size')

  @update_rank: ->
    console.log("Update Dashboard Called")
    token = $('input[name=authenticity_token]').val()
    console.log(token)
    medium_id = Snippy.medium_id
    console.log(Snippy.medium_id)
    client_id = $('#client_id').val()
    console.log(client_id)
    rank = $(this).data('rank')
    console.log(rank)
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/update_rank"
      data: {authenticity_token: token, medium_id:medium_id, rank:rank}
    $.ajax(settings)

  @tile_droppable: (e, ui) ->

  @update_favorite: ->
    if $(this).children().first().hasClass('favorite_off')
      console.log("Add to Favorites")
      token = $('input[name=authenticity_token]').val()
      console.log(token)
      medium_id = $(this).parent().data('medium-id')
      console.log("The Medium ID is #{medium_id}")
      client_id = $('#client_id').val()
      console.log(client_id)

      $(this).children().first().removeClass('favorite_off').addClass('favorite_on')
    else
      console.log("Add to Favorites")
      token = $('input[name=authenticity_token]').val()
      console.log(token)
      medium_id = $(this).parent().data('medium-id')
      console.log("The Medium ID is #{medium_id}")
      client_id = $('#client_id').val()
      console.log(client_id)
      $(this).children().first().removeClass('favorite_on').addClass('favorite_off')
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/update_favorites"
      data: {authenticity_token: token, medium_id:medium_id}
    $.ajax(settings)

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

