class HomeController < ApplicationController

  # register exception handlers
  [JSON::ParserError, OpenURI::HTTPError, URI::InvalidURIError, SocketError].each do |exception|
    rescue_from exception do |e|
      Api.revert_access(params['request-url']) if params['request-url']
      flash[:message] = t(exception.to_i18n_error_key)
      respond_to do |format|
        format.html { redirect_to convert_url }
        format.json { render :json => false }
        format.js   { render :json => false }
      end
    end
  end

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

  def stylesheet
    respond_to do |format|
      format.js {
        response.headers['Content-Type'] = 'text/xml'
        render :xml => File.open("#{RAILS_ROOT}/public/xml2json.xsl").read
      }
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

