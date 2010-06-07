$(document).ready(function(){

  $("div.flash").each(function(i, el) {
    $(this).css({top: "-61px"}); // hack hack hack, unable to calculate total height of the element
    $(this).animate({
      top: 0
    }, 1500).delay(1000).animate({
      top: "-61px"
    }, 1500);
  });

});

