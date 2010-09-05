require 'spec_helper'

describe BillItemsController do

  def mock_bill_item(stubs={})
    @mock_bill_item ||= mock_model(BillItem, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all bill_items as @bill_items" do
      BillItem.stub(:all) { [mock_bill_item] }
      get :index
      assigns(:bill_items).should eq([mock_bill_item])
    end
  end

  describe "GET show" do
    it "assigns the requested bill_item as @bill_item" do
      BillItem.stub(:find).with("37") { mock_bill_item }
      get :show, :id => "37"
      assigns(:bill_item).should be(mock_bill_item)
    end
  end

  describe "GET new" do
    it "assigns a new bill_item as @bill_item" do
      BillItem.stub(:new) { mock_bill_item }
      get :new
      assigns(:bill_item).should be(mock_bill_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested bill_item as @bill_item" do
      BillItem.stub(:find).with("37") { mock_bill_item }
      get :edit, :id => "37"
      assigns(:bill_item).should be(mock_bill_item)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created bill_item as @bill_item" do
        BillItem.stub(:new).with({'these' => 'params'}) { mock_bill_item(:save => true) }
        post :create, :bill_item => {'these' => 'params'}
        assigns(:bill_item).should be(mock_bill_item)
      end

      it "redirects to the created bill_item" do
        BillItem.stub(:new) { mock_bill_item(:save => true) }
        post :create, :bill_item => {}
        response.should redirect_to(bill_item_url(mock_bill_item))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bill_item as @bill_item" do
        BillItem.stub(:new).with({'these' => 'params'}) { mock_bill_item(:save => false) }
        post :create, :bill_item => {'these' => 'params'}
        assigns(:bill_item).should be(mock_bill_item)
      end

      it "re-renders the 'new' template" do
        BillItem.stub(:new) { mock_bill_item(:save => false) }
        post :create, :bill_item => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested bill_item" do
        BillItem.should_receive(:find).with("37") { mock_bill_item }
        mock_bill_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bill_item => {'these' => 'params'}
      end

      it "assigns the requested bill_item as @bill_item" do
        BillItem.stub(:find) { mock_bill_item(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:bill_item).should be(mock_bill_item)
      end

      it "redirects to the bill_item" do
        BillItem.stub(:find) { mock_bill_item(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(bill_item_url(mock_bill_item))
      end
    end

    describe "with invalid params" do
      it "assigns the bill_item as @bill_item" do
        BillItem.stub(:find) { mock_bill_item(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:bill_item).should be(mock_bill_item)
      end

      it "re-renders the 'edit' template" do
        BillItem.stub(:find) { mock_bill_item(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested bill_item" do
      BillItem.should_receive(:find).with("37") { mock_bill_item }
      mock_bill_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bill_items list" do
      BillItem.stub(:find) { mock_bill_item }
      delete :destroy, :id => "1"
      response.should redirect_to(bill_items_url)
    end
  end

end
