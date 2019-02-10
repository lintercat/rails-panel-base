$(document).on 'turbolinks:load', ->
  $('.tooltip').remove()
  $('a').tooltip()
