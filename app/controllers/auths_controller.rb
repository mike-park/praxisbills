class AuthsController < ApplicationController
  def index
    @auths = Auth.all
  end

  def show
    @auth = Auth.find(params[:id])
  end
  
  def edit
    @auth = Auth.find(params[:id])
  end
  
  def new
    @auth = Auth.new(params.slice(:patient_id, :invoice_id))
  end

  def create
    @auth = Auth.new(params[:auth])
    if @auth.save
      redirect_to(new_auth_bill_item_path(@auth),
                  :notice => 'Auth was successfully created')
    else
      render :action => 'new'
    end
  end

  def update
    @auth = Auth.find(params[:id])
    if @auth.update_attributes(params[:auth])
      redirect_to(@auth, :notice => 'Auth was successfully updated')
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @auth = Auth.find(params[:id])
    @auth.destroy
    redirect_to(@auth.invoice)
  end

end
