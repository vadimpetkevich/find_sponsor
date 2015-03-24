$(document).on 'ajax:success', '.like-link', (status,data,xhr)->
  $('.dislikes_count').text data.dislikes_count
  $('.likes_count').text data.likes_count
  return

$(document).on 'ajax:success', '.dislike-link', (status,data,xhr)->
  $('.dislikes_count').text data.dislikes_count
  $('.likes_count').text data.likes_count
  return

$(document).on 'ajax:success', '.interesting-link', (status,data,xhr)->
  if data.happened == 'liked'
    $('.interesting-span').toggleClass('fa-circle-o fa-circle');
  else
    $('.interesting-span').toggleClass('fa-circle fa-circle-o');
  return
