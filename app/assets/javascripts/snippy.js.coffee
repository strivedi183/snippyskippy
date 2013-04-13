class Snippy
  @document_ready: ->
    Snippy.video_hover()
    $(".draggable").draggable({snap: ".style", zIndex: 9999, revert: true, opacity: 0.5, drag: Snippy.get_draggable_info})
    $(".droppable").droppable({drop: Snippy.update_rank})
    $('#tiles').on('click', '.favorites', Snippy.update_favorite)
    $('body').on('click', '#login-form-btn', Snippy.show_login_form)
    $(window).load(Snippy.refresh)
    $('#carousel').jKit('carousel', { 'autoplay': 'yes', 'interval': '3000' })
    $('#login_form').on('click', 'a[data-clear-form]', Snippy.clear_form)
    $('#dashboard_show').click(Snippy.show_dashboard)
    $('#dashboard_hide').click(Snippy.hide_dashboard)
    $('#dashboard_hide').hide()
    $('body').on('keypress', Snippy.easter_egg_video)
    $('#side-menu').sidr()

  @show_dashboard: ->
    $('#user_header').slideDown('slow')
    $('#user_header').removeClass('hide')
    $('#dashboard_show').hide()
    $('#dashboard_hide').show()

  @hide_dashboard: ->
    $('#user_header').slideUp('slow')
    $('#dashboard_hide').hide()
    $('#dashboard_show').show()


  @refresh: ->
    $('#main').trigger('refreshWookmark')

  @clear_form: (e) ->
    e.preventDefault()
    console.log('hiding')
    $('#login_form').addClass('hide')

  @show_login_form: ->
    $('#login_form').removeClass('hide')

  @get_draggable_info: (e, ui) ->
    Snippy.medium_id = $(this).data('medium-id')
    console.log("The Medium ID is #{Snippy.medium_id}")
    # ui.helper.addClass('drag_size')

  @clear_all_ranks: ->
    client_id = $('#client_id').val()
    token = $('input[name=authenticity_token]').val()
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/clear_ranks"
      data: {authenticity_token: token}
    $.ajax(settings)

  @update_rank: (e, ui) ->
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
    $.ajax(settings).done(Snippy.update_rank_response())

  @update_rank_response: ->
    console.log("This works")

  @update_favorite: ->
    x = $(this).parent().hasClass('favorite')
    console.log(x)
    if $(this).children().first().hasClass('favorite_off')
      console.log("Add to Favorites")
      token = $('input[name=authenticity_token]').val()
      console.log(token)
      medium_id = $(this).parent().data('medium-id')
      console.log("The Medium ID is #{medium_id}")
      client_id = $('#client_id').val()
      console.log(client_id)
      $(this).parent().parent().addClass('favorite')
      $(this).children().first().removeClass('favorite_off').addClass('favorite_on')
      $(this).children().first().addClass('top_3_ribbon')

    else
      console.log("Add to Favorites")
      token = $('input[name=authenticity_token]').val()
      console.log(token)
      medium_id = $(this).parent().data('medium-id')
      console.log("The Medium ID is #{medium_id}")
      client_id = $('#client_id').val()
      console.log(client_id)
      $(this).parent().parent().removeClass('favorite')
      $(this).children().first().removeClass('favorite_on').addClass('favorite_off')
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/update_favorites"
      success: "Good job"
      data: {authenticity_token: token, medium_id:medium_id}
    $.ajax(settings)

  @video_hover: ->
    $('video').prop('muted',true).hover (->
      $(this).css "opacity", "1"
      @play()
    ), ->
      $(this).css "opacity", "1"
      @pause()

  @easter_egg_video: (e) ->
    console.log('rotate!')
    console.log(e)
    console.log(e.which)
    if e.which == 114
      console.log('event is pressed')
      $('video').each (index, element) =>
        element.play()

window.Snippy = Snippy

$(document).ready(Snippy.document_ready)
# # -- closes drop down menu by clicking outside the field -- #

# $(document).click (e) ->
#   e.stopPropagation()
#   container = $(".f-dropdown")
#   $("#drop").hide()  if container.has(e.target).length is 0
#   # $("#email").val ""
#   # $("#password_field").val ""

# # -- end -- #

