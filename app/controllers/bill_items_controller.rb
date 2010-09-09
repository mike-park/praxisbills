class BillItemsController < ApplicationController
  before_filter :find_auth_and_invoice

  def create
    @bill_item = BillItem.new(params[:bill_item])
    @bill_item.auth = @auth;
    if @bill_item.save
      redirect_to @auth, :notice => 'Therapy added'
    else
      render 'auths/show'
    end
  end

  def edit
    @bill_item = BillItem.find(params[:id])
    render 'auths/show'
  end
  
  def update
    @bill_item = BillItem.find(params[:id])
    if @bill_item.update_attributes(params[:bill_item])
      redirect_to @auth, :notice => "Updated successfully"
    else
      render 'auths/show'
    end
  end

  def destroy
    @bill_item = BillItem.find(params[:id])
    @bill_item.destroy
    redirect_to @auth, :notice => 'Therapy deleted'
  end

  private

  def find_auth_and_invoice
    @auth = Auth.find(params[:auth_id])
    @invoice = current_invoice
  end
end
