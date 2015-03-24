$(document).on 'ajax:success', '.like-link', (status,data,xhr)->
  $('.dislikes_count').text data.dislikes_count
  $('.likes_count').text data.likes_count
  return

$(document).on 'ajax:success', '.dislike-link', (status,data,xhr)->
  $('.dislikes_count').text data.dislikes_count
  $('.likes_count').text data.likes_count
  return

$(document).on 'ajax:success', '.interesting-link', (status,data,xhr)->
  alert 'adsfadfsdf'
  return
