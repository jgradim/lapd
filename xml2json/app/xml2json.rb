class Xml2json

  def self.convert(url)

    xml = open(URI.escape(url)).read rescue ""
    doc = Nokogiri::XML(xml)
    xslt  = Nokogiri::XSLT(File.read('lib/xml2json.xsl'))

    xslt.transform(doc)
  end

end

