class ApisController < ApplicationController
  before_filter :require_user

  # GET /apis
  # GET /apis.xml
  def index
    @apis = Api.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apis }
    end
  end

  # GET /apis/1/edit
  def edit
    @api = Api.find(params[:id])
  end

  # PUT /apis/1
  # PUT /apis/1.xml
  def update
    @api = Api.find(params[:id])

    respond_to do |format|
      if @api.update_attributes(params[:api])
        flash[:notice] = 'Api was successfully updated.'
        format.html { redirect_to apis_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @api.errors, :status => :unprocessable_entity }
      end
    end
  end

end

