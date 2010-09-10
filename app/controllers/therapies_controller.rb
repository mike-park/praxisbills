class TherapiesController < ApplicationController
  def index
    @therapies = Therapy.paginate :page => params[:page], :per_page => 10,
    :order => "code"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @therapies }
    end
  end

  def show
    @therapy = Therapy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @therapy }
    end
  end

  def new
    @therapy = Therapy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @therapy }
    end
  end

  def edit
    @therapy = Therapy.find(params[:id])
  end

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

  def destroy
    @therapy = Therapy.find(params[:id])
    @therapy.destroy

    respond_to do |format|
      format.html { redirect_to(therapies_url) }
      format.xml  { head :ok }
    end
  end
end
