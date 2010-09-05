class TherapiesController < ApplicationController
  # GET /therapies
  # GET /therapies.xml
  def index
    @therapies = Therapy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @therapies }
    end
  end

  # GET /therapies/1
  # GET /therapies/1.xml
  def show
    @therapy = Therapy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @therapy }
    end
  end

  # GET /therapies/new
  # GET /therapies/new.xml
  def new
    @therapy = Therapy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @therapy }
    end
  end

  # GET /therapies/1/edit
  def edit
    @therapy = Therapy.find(params[:id])
  end

  # POST /therapies
  # POST /therapies.xml
  def create
    @therapy = Therapy.new(params[:therapy])

    respond_to do |format|
      if @therapy.save
        format.html { redirect_to(@therapy, :notice => 'Therapy was successfully created.') }
        format.xml  { render :xml => @therapy, :status => :created, :location => @therapy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @therapy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /therapies/1
  # PUT /therapies/1.xml
  def update
    @therapy = Therapy.find(params[:id])

    respond_to do |format|
      if @therapy.update_attributes(params[:therapy])
        format.html { redirect_to(@therapy, :notice => 'Therapy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @therapy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /therapies/1
  # DELETE /therapies/1.xml
  def destroy
    @therapy = Therapy.find(params[:id])
    @therapy.destroy

    respond_to do |format|
      format.html { redirect_to(therapies_url) }
      format.xml  { head :ok }
    end
  end
end
