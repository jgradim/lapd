$(document).ready(function(){
  if(!Modernizr.input.placeholder){
    $("input[placeholder]").each(function() {
      $(this).placeholder({
        text: $(this).attr('placeholder')
      });
    });
  }
});
