var xslt = new XSLTProcessor();
var dom_parser = new DOMParser();
var res;
$(document).ready(function(){

  // import xslt stylesheet for live editor
  $.get('/xml2json.xsl', function(data) {
    xslt.importStylesheet(data);
  });
  
  $("#xml-source").bind('keyup', function(){
    var xml = dom_parser.parseFromString($(this).val(), "text/xml");
    var result = JSON.parse(xslt.transformToFragment(xml, document).textContent);
    
    if(!("parsererror" in result)) {
      $("#json-result").val(JSON.stringify(result, null, "  "));
    }
    else {
      // alert xml is invalid
    }
  });
  
});
