function menuLoad() {
  $("#genre_rankings").ready(function() {
    $(this).find("ul.hidden li").css({visibility: "hidden"});
  });
}

function menu() {
  $("#genre_rankings").hover(function() {
    $(this).find("ul.hidden li").css({visibility: "visible", display: "none"}).show(600);
    }, function(){
    $(this).find("ul.hidden li").css({visibility: "hidden"});
  });
}

$(function(){
  menu();
  menuLoad();
});


// $(this).css({'background-color': 'rgb(237, 243, 241)'});
//     }, function(){