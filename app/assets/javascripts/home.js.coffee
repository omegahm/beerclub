$ ->
  $('.show-old-users').click ->
    $('.old-user, .old-user td').fadeIn()
    $('.show-old-users, .hide-old-users, .hidden-product').toggleClass('hide');

  $('.hide-old-users').click ->
    $('.old-user, .old-user td').fadeOut()
    $('.show-old-users, .hide-old-users, .hidden-product').toggleClass('hide');
