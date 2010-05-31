var xslt = new XSLTProcessor();
var dom_parser = new DOMParser();

$(document).ready(function(){

  // import xslt stylesheet for live editor
  $.get('/xml2json.xsl', function(data) {
    xslt.importStylesheet(data);
  });
  
  $("div#warning").css({
    height: $("#json-result").css('height'),
    width: $("#json-result").css('width'),
    top: $("#json-result").offset().top + 1,
    left: $("#json-result").offset().left + 1,
    lineHeight: $("#json-result").css('height')
  });
  
  $("#xml-source").bind('keyup', function(ev) {
  
    var xml = dom_parser.parseFromString($(this).val(), "text/xml");
    var result = xslt.transformToFragment(xml, document).textContent;
    
    if(!result.match(/parsererror/)) {
      $("#json-result").val(JSON.stringify(JSON.parse(result), null, "  "));
      $("div#warning").hide();
    }
    else {
      $("div#warning").show();
    }
  }).tabby();
  
});
