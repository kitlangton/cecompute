
format2 = (n, currency) ->
  currency + "" + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,")

window.hi = ->
  @last_quantity = 0
  $("#quantity").focus()
  $("#quantity").bind "change keyup", ->
    quantity = +$(this).val() or 1
    total_cost = +$(".total-cost").data "total"
    $total = $(".total-cost")
    base_cost = +$(".base-cost").data "base-cost"
    dupe_cost = +$(".duplicate-cost").data "dupe-cost"
    # console.log (base_cost + (dupe_cost * (quantity - 1)))
    if quantity > 1
      $(".duplicate-cost").removeClass "inactive", 200
      $(".inactive-label").addClass "duplicate-cost-label", 200

      $(".multiplier").removeClass "nopacity", 200
      $("#dupe-quantity").text(quantity - 1)
      $("#dupe-total").text format2((dupe_cost * (quantity - 1)), "$")

    else
      $(".multiplier").addClass "nopacity", 200
      $(".duplicate-cost").addClass "inactive", 200
      $(".inactive-label").removeClass "duplicate-cost-label", 200
    if quantity > @last_quantity
      $(".total-cost").addClass 'new-price-plus'
      $(".total-cost").removeClass 'new-price-plus', 300
    if quantity < @last_quantity
      $(".total-cost").addClass 'new-price-minus'
      $(".total-cost").removeClass 'new-price-minus', 300
    $total.text format2((base_cost + (dupe_cost * (quantity - 1))), "$")
    @last_quantity = quantity

$ ->
  window.hi()
  $('.select-val').val "1"
