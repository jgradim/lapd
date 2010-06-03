class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html
    end
  end
  
  def editor
    respond_to do |format|
      format.html
    end
  end
  
  def convert
    @json = Xml2json.convert(params['request-url']) if params['request-url']
    @pretty_json = JSON.pretty_generate(JSON.parse(@json)) if @json
    respond_to do |format|
      format.html
    end
  end

end
