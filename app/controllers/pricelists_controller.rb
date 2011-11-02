class PricelistsController < ApplicationController
  # GET /pricelists
  # GET /pricelists.xml
  def index
    @pricelists = Pricelist.by_date.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pricelists }
    end
  end

  # GET /pricelists/1
  # GET /pricelists/1.xml
  def show
    @pricelist = Pricelist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pricelist }
    end
  end

  # GET /pricelists/new
  # GET /pricelists/new.xml
  def new
    @pricelist = Pricelist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pricelist }
    end
  end

  # GET /pricelists/1/edit
  def edit
    @pricelist = Pricelist.find(params[:id])
  end

  # POST /pricelists
  # POST /pricelists.xml
  def create
    @pricelist = Pricelist.new(params[:pricelist])

    respond_to do |format|
      if @pricelist.save
        format.html { redirect_to(@pricelist, :notice => 'Pricelist was successfully created.') }
        format.xml  { render :xml => @pricelist, :status => :created, :location => @pricelist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pricelist.errors, :status => :unprocessable_entity }
      end
    end
  end

  def clone
    @pricelist = Pricelist.find(params[:id]).deep_clone
    msg = if @pricelist.save
            { :notice => 'Pricelist is cloned' }
          else
            { :alert => 'Pricelist could not be cloned' }
          end
    redirect_to(pricelists_url, msg)
  end


  # PUT /pricelists/1
  # PUT /pricelists/1.xml
  def update
    @pricelist = Pricelist.find(params[:id])

    respond_to do |format|
      if @pricelist.update_attributes(params[:pricelist])
        format.html { redirect_to(@pricelist, :notice => 'Pricelist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pricelist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pricelists/1
  # DELETE /pricelists/1.xml
  def destroy
    @pricelist = Pricelist.find(params[:id])
    @pricelist.destroy

    respond_to do |format|
      format.html { redirect_to(pricelists_url) }
      format.xml  { head :ok }
    end
  end
end
