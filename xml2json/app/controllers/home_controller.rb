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
    respond_to do |format|
      format.html
    end
  end

end
