$(document).ready ->
  $container = $("#container").isotope
    itemSelector: ".item"
    masonry: 
      isFitWidth: true
      columnWidth: 200
      gutter: 20
    getSortData: 
      name: '.product-name'
      price: '.cost parseInt'

  $container.fadeIn()
  $container.isotope "layout", "start"
  $(".top-bar-logo").fadeIn()
  $("#joy-start").click ->
    $(document).foundation 'joyride', 'start'
  $(".product-link").hover (->
    $(this).closest(".item").find(".product-name a").stop(true).animate
      color: "rgb(247,143,30)", 200
  ), ->
    $(this).closest(".item").find(".product-name a").stop(true).animate
      color: "black", 200

$(document).ready ->
  $(".product-name").dotdotdot()
  
$ ->
  $('#sort-by-price').click ->
    $("#container").isotope({ sortBy : 'price'})
  $('#sort-by-name').click ->
    $("#container").isotope({ sortBy : 'name'})

$ ->
  $(".image-upload-replace").click ->
    $("#upload-button").click()
  $("#upload-button:file").change ->
    $(".image-upload-replace").text $(this).val().split('\\').pop()

