class AuthsController < ApplicationController
  # GET /auths
  # GET /auths.xml
  def index
    @auths = Auth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @auths }
    end
  end

  # GET /auths/1
  # GET /auths/1.xml
  def show
    @auth = Auth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auth }
    end
  end

  # GET /auths/new
  # GET /auths/new.xml
  def new
    @auth = Auth.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @auth }
    end
  end

  # GET /auths/1/edit
  def edit
    @auth = Auth.find(params[:id])
  end

  # POST /auths
  # POST /auths.xml
  def create
    @auth = Auth.new(params[:auth])

    respond_to do |format|
      if @auth.save
        format.html { redirect_to(@auth, :notice => 'Auth was successfully created.') }
        format.xml  { render :xml => @auth, :status => :created, :location => @auth }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @auth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /auths/1
  # PUT /auths/1.xml
  def update
    @auth = Auth.find(params[:id])

    respond_to do |format|
      if @auth.update_attributes(params[:auth])
        format.html { redirect_to(@auth, :notice => 'Auth was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @auth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /auths/1
  # DELETE /auths/1.xml
  def destroy
    @auth = Auth.find(params[:id])
    @auth.destroy

    respond_to do |format|
      format.html { redirect_to(auths_url) }
      format.xml  { head :ok }
    end
  end
end
