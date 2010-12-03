class InsurersController < ApplicationController
  # GET /insurers
  # GET /insurers.xml
  def index
    @insurers = Insurer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurers }
    end
  end

  # GET /insurers/1
  # GET /insurers/1.xml
  def show
    @insurer = Insurer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurer }
    end
  end

  # GET /insurers/new
  # GET /insurers/new.xml
  def new
    @insurer = Insurer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurer }
    end
  end

  # GET /insurers/1/edit
  def edit
    @insurer = Insurer.find(params[:id])
  end

  # POST /insurers
  # POST /insurers.xml
  def create
    @insurer = Insurer.new(params[:insurer])

    respond_to do |format|
      if @insurer.save
        format.html { redirect_to(@insurer, :notice => 'Insurer was successfully created.') }
        format.xml  { render :xml => @insurer, :status => :created, :location => @insurer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurers/1
  # PUT /insurers/1.xml
  def update
    @insurer = Insurer.find(params[:id])

    respond_to do |format|
      if @insurer.update_attributes(params[:insurer])
        format.html { redirect_to(@insurer, :notice => 'Insurer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurers/1
  # DELETE /insurers/1.xml
  def destroy
    @insurer = Insurer.find(params[:id])
    @insurer.destroy

    respond_to do |format|
      format.html { redirect_to(insurers_url) }
      format.xml  { head :ok }
    end
  end
end
