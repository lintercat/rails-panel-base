$(document).on 'click', 'a[data-add-resource]', (e) ->
  e.preventDefault()
  $el = $(this)

  time = new Date().getTime()
  regexp = new RegExp($el.data('add-resource'), 'g')
  content = $el.data('fields').replace(regexp, time)


  if typeof $el.data('insert-type') is 'undefined' or $el.data('insert-type') is 'append'
    $($el.data('target')).append(content).children(':last').hide().fadeIn()
  else if $el.data('insert-type') is 'prepend'
    $($el.data('target')).prepend(content).children(':last').hide().fadeIn()
  else
    switch $el.data('insert-type')
      when 'after'
        $($el.data('target')).after(content)

  if typeof($el.data('trigger')) isnt "undefined" && $el.data('trigger') isnt null && $.inArray($el.data('trigger'), ['click', 'submit'])
    $(document).trigger($el.data('trigger'), [$el, time])

  # init select2's inside the content
  $('select.select2-rails').each ->
    unless $(@).data('select2')
      $(@).select2()

  # init tooltips inside the content
  $('[data-toggle="tooltip"]').tooltip()


# Usage:
# <%= link_to_destroy_fields 'link_text', '#container-of-nested-ff' %>
$(document).on 'click', 'a[data-delete-resource]', (e) ->
  $el = $(@)
  $container = $el.closest($el.data('target'))
  $container.find('input[type=hidden][data-destroy]').val('1').trigger('change')
  $container.fadeOut()
  e.preventDefault()

  if typeof($el.data('trigger')) isnt "undefined" and $el.data('trigger') isnt null and $.inArray($el.data('trigger'), ['click', 'submit'])
    $(document).trigger($el.data('trigger'), [$container])
