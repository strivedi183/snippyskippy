$ ->
  $('body').chardinJs()

  $('a[data-toggle="chardinjs"]').on 'click', (e) ->
    e.preventDefault()
    if ($('body').data('chardinJs')).toggle()
    else
      ($('body').data('chardinJs')).toggle()
