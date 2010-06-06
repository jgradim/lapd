class HomeController < ApplicationController

  def index
    @apis = Api.all
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

    Api.access(params['request-url']) if params['request-url']

    @json = Xml2json.convert(params['request-url']) if params['request-url']
    @pretty_json = JSON.pretty_generate(JSON.parse(@json)) if @json

    respond_to do |format|
      format.html
      format.json { render :text => @json }
      format.js   { render :text => @json }
    end
  end

end

