class BillItemsController < ApplicationController
  def new
    @bill_item = BillItem.new(:auth_id => params[:auth_id])
  end
  
  def create
    @bill_item = BillItem.new(params[:bill_item])
    if @bill_item.save
      redirect_to auth_path(@bill_item.auth_id,
                            :notice => 'Therapy added')
    else
      render 'new'
    end
  end

  def edit
    @bill_item = BillItem.find(params[:id])
    @auth = @bill_item.auth;
    render 'auths/show'
  end
  
  def update
    @bill_item = BillItem.find(params[:id])
    if @bill_item.update_attributes(params[:bill_item])
      redirect_to(auth_path(@bill_item.auth_id),
                  :notice => "Updated successfully")
    else
      render 'edit'
    end
  end

  def destroy
    @bill_item = BillItem.find(params[:id])
    @bill_item.destroy
    redirect_to auth_path(@bill_item.auth_id,
                          :notice => 'Therapy deleted')
  end
end
