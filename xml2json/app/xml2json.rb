class Xml2json

  def self.convert(url)
    
    url = URI.escape(url)
     
     xml = ''
     
     open(url) do |f|
      xml = f.read
     end
     
     xslt = XML::XSLT.new()
     xslt.xml = xml
     xslt.xsl = "lib/xml2json.xsl"

     xslt.serve()
  end

end
