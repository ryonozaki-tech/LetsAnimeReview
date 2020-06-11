function menuLoad() {
  $(".menu_item_genres").ready(function() {
    $("#genre_rankings").find("ul.hidden li").css({visibility: "hidden"});
  });
}

function menu() {
  $(".menu_item_genres").hover(function() {
    $("#genre_rankings").find("ul.hidden li").css({visibility: "visible", display: "none"}).show(600);
    }, function(){
    $("#genre_rankings").find("ul.hidden li").css({visibility: "hidden"});
  });
}

$(function(){
  menu();
  menuLoad();
});


// $(this).css({'background-color': 'rgb(237, 243, 241)'});
//     }, function(){