$ ->
  $(".toggle-delete").click ->
    $(".delete-service").toggleClass "hidden"
    $(this).toggleClass "red", 250

  $(".delete-service").click ->
    $(this).parents(".service").fadeOut 59
    return

