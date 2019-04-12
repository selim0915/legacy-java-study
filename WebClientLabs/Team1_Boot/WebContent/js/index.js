var sizeTheOverlays = function() {
    $(".overlay").resize().each(function() {
    var h = $(this).parent().outerHeight();
    var w = $(this).parent().outerWidth();
    $(this).css("height", h);
    $(this).css("width", w);
  });
};

sizeTheOverlays();


var width = $(window).width();
$(window).resize(function(){
   if($(this).width() != width){
      width = $(this).width();
      sizeTheOverlays();
   }
});


/* zzang page */

$( document ).ready(function() {
var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
$(".left-list").on('click',
function(){
$(this).find('span').addClass('animated rubberBand').one(animationEnd, function() {
        $(this).find('span').removeClass('animated rubberBand')
});
});

});

