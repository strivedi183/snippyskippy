$ ->
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

