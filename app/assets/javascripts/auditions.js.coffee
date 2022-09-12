select_to_select2 = ->
  $('#audition_hear_about_us').select2( {tags: true} )

$(document).on 'turbolinks:load', ->
  select_to_select2()
