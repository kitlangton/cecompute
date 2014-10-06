# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $('.best_in_place').best_in_place()
  $('.best_in_place').on "blur", "form", (e) ->
    id = $(this).closest(".best_in_place").data 'url'
    id = id.match(/(\d+)/)[0]

$ ->
  $(".remove-button").on "click", ->
    $(@).closest(".cart-insides").fadeOut()
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    $.get '/cart/total', (data) ->
      $('.total-text').text data['total']
      $('.total-text').addClass 'new-price-minus'
      $('.total-text').removeClass 'new-price-minus', 200
  $(".best_in_place").bind "ajax:success", (e, data, status, xhr) ->
    url = $(this).data 'url'
    $.get url, (data) =>
      $(this).closest(".cart-row").find(".subtotal-text").text data['subtotal']
      $(this).closest(".cart-row").find(".subtotal-text").addClass 'new-price-plus'
      $(this).closest(".cart-row").find(".subtotal-text").removeClass 'new-price-plus', 200
    $.get '/cart/total', (data) =>
      $('.total-text').text data['total']
      $('.total-text').addClass 'new-price-plus'
      $('.total-text').removeClass 'new-price-plus', 200
    return
