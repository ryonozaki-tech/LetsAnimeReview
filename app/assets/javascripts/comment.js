$(function() {
  function buildHTML(comment) {
    var html = `<div class="comment">
                <div class="comment__text">
                ${comment.text}
                </div>
                <div class="comment__data">
                  <a class="comment__data__nickname" href="/users/${comment.user_id}">
                  ${comment.user_name}
                  </a>
                  <div class="comment__data__date">
                  ${comment.created_at}
                  </div>
                </div>
              </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    // console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.comment_box').append(html);
      $('.text_area').val('');
      $('.submit_btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});





// <% if ${comments}.present? %>
// <% else %>
// <h2>コメントはありません</h2>

// if (comments.length) {
//   var html = `<div class="comment">
//                 <div class="comment__text">
//                 ${comment.text}
//                 </div>
//                 <div class="comment__data">
//                   <a class="comment__data__nickname" href="/users/${comment.user_id}">
//                   ${comment.user_name}
//                   </a>
//                   <div class="comment__data__date">
//                   ${comment.created_at}
//                   </div>
//                 </div>
//               </div>`
//   return html;
// } else {
//   var html = `<h2>コメントはありません</h2>`
// }