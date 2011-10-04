class BillItemsController < ApplicationController
  before_filter :find_auth

  def new
    @bill_item = BillItem.new
  end

  def create
    @bill_item = BillItem.new(params[:bill_item])
    @bill_item.auth = @auth
    if @bill_item.save
      redirect_to new_auth_bill_item_path(@auth), :notice => 'Therapy added'
    else
      render 'new'
    end
  end

  def edit
    @bill_item = BillItem.find(params[:id])
  end
  
  def update
    @bill_item = BillItem.find(params[:id])
    if @bill_item.update_attributes(params[:bill_item])
      redirect_to @auth, :notice => "Updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @bill_item = BillItem.find(params[:id])
    @bill_item.destroy
    redirect_to @auth, :notice => 'Therapy deleted'
  end

  private

  def find_auth
    @auth = Auth.find(params[:auth_id])
  end
end
