
format2 = (n, currency) ->
  currency + "" + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,")

window.hi = ->

  # $(".service").hover (->
  #   $(this).animate "font-size", "150%", 50
  #   $(this).click ->
  #     $(this).css "color", ""
  #   return
  # ), ->
  #   $(this).css "color", ""
  #   return

  $(".service").click ->
    price = $(this).data('price')
    if $(this).hasClass "dormant"
      $(this).addClass "active"
      # $(this).toggleClass('active', 150).toggleClass('dormant', 150);
      $(this).removeClass "dormant"
      current_total = $("#totalprice").data('total')
      $("#totalprice").data 'total', parseInt( price * 100 + current_total )
      current_total = $("#totalprice").data('total')
      $("#totalprice").text "" + format2(current_total / 100, "$")
      $("#total").addClass 'new-price-plus'
      $("#total").removeClass 'new-price-plus', 300
      $(this).addClass 'new-price-plus'
      $(this).removeClass 'new-price-plus', 300
      $(this).find('.select-val').val "selected"
      if current_total > 0
        $('#totalprice').addClass "green"

      return
    if $(this).hasClass "active"
      $(this).addClass "dormant"
      $(this).removeClass "active"
      current_total = $("#totalprice").data('total')
      $("#totalprice").data 'total', parseInt( current_total - price * 100 )
      current_total = $("#totalprice").data('total')
      $("#totalprice").text "" + format2(current_total / 100, "$")
      $("#total").addClass 'new-price-minus'
      $("#total").removeClass 'new-price-minus', 300
      $(this).addClass 'new-price-minus'
      $(this).removeClass 'new-price-minus', 300
      $(this).find('.select-val').val "1"

$ ->
  window.hi()
  $('.select-val').val "1"


