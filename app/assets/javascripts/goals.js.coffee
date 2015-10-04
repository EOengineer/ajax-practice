$.fn.render_form_errors = (model_name, errors) ->
  form = $('#' + model_name + '-form')
  this.clear_form_errors()

  $.each(errors, (field, messages) ->
    input = form.find('input, select, textarea').filter(->
      name = $(this).attr('name')
      if name
        name.match(new RegExp(model_name + '\\[' + field + '\\(?'))
    )
    input.closest('.field').addClass('has-error')
    input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
  )
$.fn.clear_form_errors = () ->
  this.find('.field').removeClass('has-error')
  this.find('span.help-block').remove()


$.fn.clear_form_fields = (form) ->
  this.find(':input', form)
      .not(':button, :submit, :reset, :hidden')
      .val('')
      .removeAttr('checked')
      .removeAttr('selected')


$(document).bind "ajax:success", (event, data, xhr, settings) ->
  $location = data.location
  $flashSuccess = data.flash.notice

  $('#goal-form').clear_form_errors()
  $('#goal-form').clear_form_fields('#goal-form')
  $('body').append('<div><li>' + $flashSuccess + '</li></div>')
  window.location.href = data.location

$(document).bind "ajax:error", (event, data, xhr, settings) ->
  $($(this)).render_form_errors('goal', data.responseJSON)


