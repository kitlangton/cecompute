$(document).ready ->
  $container = $("#container").isotope
    itemSelector: ".item"
    masonry: 
      isFitWidth: true
      columnWidth: 200
      gutter: 20
  $container.fadeIn()
  $(".top-bar-logo").fadeIn()
  $("#joy-start").click ->
    $(document).foundation 'joyride', 'start'
  $(".product-link").hover (->
    $(this).closest(".item").find(".product-name a").animate
      color: "rgb(247,143,30)", 100
  ), ->
    $(this).closest(".item").find(".product-name a").animate
      color: "black", 100
