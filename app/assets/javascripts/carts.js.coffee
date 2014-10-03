# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $('.best_in_place').best_in_place()
  $('.best_in_place').on "blur", "form", (e) ->
    id = $(this).closest(".best_in_place").data 'url'
    id = id.match(/(\d+)/)[0]
    alert id
