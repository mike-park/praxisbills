class AuthsController < ApplicationController
  def index
    @auths = Auth.all
  end

  def show
    @auth = Auth.find(params[:id])
    @bill_item = BillItem.new(:auth_id => @auth.id)
    @invoice = current_invoice
  end
  
  def edit
    @auth = Auth.find(params[:id])
    @bill_item = BillItem.new(:auth_id => @auth.id)
    @invoice = current_invoice
  end
  
  def new
    @auth = Auth.new
    @auth.patient = current_patient
    @auth.invoice = current_invoice
  end

  def create
    @auth = Auth.new(params[:auth])
    if @auth.save
      redirect_to(@auth,
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
    @invoice = current_invoice
    redirect_to(@invoice ? @invoice : invoices_path)
  end

end
