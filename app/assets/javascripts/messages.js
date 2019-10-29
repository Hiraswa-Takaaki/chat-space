
$(function(){
  function buildMessage(post){
    var image = post.image ? `<img src=${post.image}>`: '';
    var html = `<div class="message">
                  <div class="upper-message">
                  <div class="upper-message__user-name">
                    ${post.user_id}
                  </div>
                  <div class="upper-message__date">
                    ${post.date}
                  </div>
                  </div>
                  <div class="lower-message">
                  <p class="lower-message__content">
                    ${post.content}
                  </p>
                    ${image}
                  </div>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formdata = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(post){
      var html = buildMessage(post);
      $('.messages').append(html)
      $('form')[0].reset();
      $('.submit-btn').attr('disabled', false);
      $('.message-box').animate({scrollTop: $('.message-box')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('送信に失敗しているよ');
    })
  })
});