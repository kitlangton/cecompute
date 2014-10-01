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
  $(".item").hover (->
    $(this).find(".product-name a").animate
      color: "rgb(247,143,30)", 200
  ), ->
    $(this).find(".product-name a").animate
      color: "black", 200
