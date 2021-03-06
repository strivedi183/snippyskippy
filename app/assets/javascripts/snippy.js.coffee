class Snippy
  @document_ready: ->
    Snippy.video_hover()
    $('#tiles').on('click', '.favorites', Snippy.update_favorite)
    $('body').on('click', '#login-form-btn', Snippy.show_login_form)
    $(window).load(Snippy.refresh)
    $('#carousel').jKit('carousel', { 'autoplay': 'yes', 'interval': '3000' })
    $('#login_form').on('click', 'a[data-clear-form]', Snippy.clear_form)
    $('body').on('keypress', Snippy.easter_egg_video)
    $('#poll').on('click', '.poll_favorite', Snippy.select_poll)
    $('#side-menu').sidr()
    $('#side-menu').on('click', Snippy.sidr_btn_text)
    $('.add_to_rank').on('click','.rank',Snippy.update_rank)
    Snippy.show_poll_disabled
    $('body').on('click', 'a[data-learn-more]', Snippy.show_onboard)
    $('.orbit-bullets').remove()
    $('.orbit-slide-number').remove()
    $('.orbit-prev').remove()
    $('.orbit-next').remove()
    Snippy.show_polls_disabled()
    $('#medium_tags').select2()
    $('#media_form').on('click', 'input[data-add-media-btn]', Snippy.update_tags)

    $('body').chardinJs()
    $('body').on "chardinJs:stop", ->
      $('#login_form.screen').addClass("hide")
      console.log('chardingJs:stop')
      $('#gear-link').data('show_form', true)

    $('body').on "chardinJs:start", ->
      console.log('chardingJs:start')
      $('#gear-link').data('show_form', false)

    $('a[data-toggle="chardinjs"]').on 'click', (e) ->
      e.preventDefault()
      $('#login_form.screen').removeClass("hide") if $(this).data('show-form')
      ($('body').data('chardinJs')).toggle()




  @update_tags: (e) ->
    x = $('#medium_tags').select2('val')
    e.preventDefault()
    $('#medium_tag_ids').val(x)
    console.log($('#medium_tag_ids').val())
    $('input[data-add-media-btn]').submit()
    jQuery.gritter.add
      image: "/assets/success.png"
      title: "Upload Successful"
      text: "Your media has been uploaded, thank you!"

  @show_onboard: ->
    $('#onboard').show()
    $('#onboard').removeClass('opacity')
    $('#call_to_action').hide()

  @show_polls_disabled: ->
    x = $('.poll_info')
    _.each(x, Snippy.show_poll_disabled)

  @show_poll_disabled: (element, index, list) ->
    console.log($(element).data('poll-is-active'))
    if $(element).data('poll-is-active') == false
      $(element).addClass('poll_done')

  @highlight_winners: (poll_id, winner_array) ->
    Snippy.poll_id = poll_id
    x = winner_array
    _.each(x, Snippy.highlight_winner)
    # console.log(winner_array)

  @highlight_winner: (element, index, list) ->
    console.log(element)
    $(".poll_image[data-poll-medium-id='#{Snippy.poll_id}_#{element}']").addClass('image_box_winner')


  @select_poll: ->
    Snippy.reset_polls()
    rank = $(this).prev().data('rank')
    if $(this).children('.center_fav').hasClass('favorite_off')
      $(this).children('.center_fav').removeClass('favorite_off')
      $(this).children('.center_fav').addClass('favorite_on')
      $('#poll_rank').val(rank)
      $('#vote-btn').removeAttr('disabled')
    else
      $(this).children('.center_fav').removeClass('favorite_on')
      $(this).children('.center_fav').addClass('favorite_off')
      $(this).next().addClass('hide')

  @reset_polls: ->
    x = $('.poll_favorite')
    _.each(x, Snippy.reset_poll)

  @reset_poll: (element, index, list) ->
    $(element).children('.center_fav').removeClass('favorite_on')
    $(element).children('.center_fav').addClass('favorite_off')
    $(element).next().addClass('hide')

  @update_poll: ->
    rank = $(this).prev().data('rank')
    medium_id = $(this).prev().data('medium-id')
    client_id = $(this).prev().data('client-id')
    console.log("Update Poll Called")
    token = $('input[name=authenticity_token]').val()
    console.log(token)
    console.log(medium_id)
    console.log(client_id)
    console.log(rank)
    # settings =
    #   dataType: 'script'
    #   type: 'post'
    #   url: "/clients/#{client_id}/update_rank"
    #   data: {authenticity_token: token, medium_id:medium_id, rank:rank}
    # $.ajax(settings).done(Snippy.update_rank_response())

    $('#side-menu').sidr()
    $('.add_to_rank').on('click','.rank',Snippy.update_rank)

  @sidr_btn_text: (e) ->
    if $(this).hasClass("hidden")
      $(this).text("Close Menu")
      $(this).removeClass("hidden")
    else
      $(this).addClass("hidden")
      $(this).text("Open Menu")

  @refresh: ->
    $('#main').trigger('refreshWookmark')
    $('#onboard').hide()

  @clear_form: (e) ->
    e.preventDefault()
    console.log('hiding')
    $('#login_form').addClass('hide')

  @show_login_form: ->
    $('#login_form').removeClass('hide')
    $('#onboard').hide()
    $('#call_to_action').show()

  @clear_all_ranks: ->
    client_id = $('#client_id').val()
    token = $('input[name=authenticity_token]').val()
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/clear_ranks"
      data: {authenticity_token: token}
    $.ajax(settings)

  @update_rank: (e) ->
    e.preventDefault()
    token = $('#auth_token').data('auth-token')
    medium_id = $('#medium_id').data('medium_id')
    client_id = $(this).data('client_id')
    rank = $(this).data('rank')
    settings =
      dataType: 'script'
      type: 'post'
      url: "/clients/#{client_id}/update_rank"
      data: {authenticity_token: token, medium_id: medium_id, rank: rank}
    $.ajax(settings)

  @update_favorite: ->
    if $(this).children().first().hasClass('favorite_off')
      console.log("Add to Favorites")
      token = $('input[name=authenticity_token]').val()
      medium_id = $(this).data('medium-id')
      client_id = $('#client_id').val()
      console.log(client_id)
      $(this).parent().parent().parent().addClass('favorite')
      $(this).children().first().removeClass('favorite_off').addClass('favorite_on')
    else
      console.log("remove from favorites")
      token = $('input[name=authenticity_token]').val()
      medium_id = $(this).data('medium-id')
      client_id = $('#client_id').val()
      $(this).parent().parent().parent().removeClass('favorite')
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