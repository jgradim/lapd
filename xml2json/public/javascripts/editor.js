var TAB = 9;

var xslt = new XSLTProcessor();
var dom_parser = new DOMParser();
var res;
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
  })
  
  $("#xml-source").bind('keyup', function(ev) {
    var xml = dom_parser.parseFromString($(this).val(), "text/xml");
    var result = JSON.parse(xslt.transformToFragment(xml, document).textContent);
    console.log(xslt.transformToFragment(xml, document).textContent);
    if(!("parsererror" in result)) {
      $("#json-result").val(JSON.stringify(result, null, "  "));
      $("div#warning").hide();
    }
    else {
      $("div#warning").show();
    }
  }).tabby();
  
});
