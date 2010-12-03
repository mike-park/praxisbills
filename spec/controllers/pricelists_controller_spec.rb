require 'spec_helper'

describe PricelistsController do

  def mock_pricelist(stubs={})
    (@mock_pricelist ||= mock_model(Pricelist).as_null_object).tap do |pricelist|
      pricelist.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pricelists as @pricelists" do
      Pricelist.stub(:all) { [mock_pricelist] }
      get :index
      assigns(:pricelists).should eq([mock_pricelist])
    end
  end

  describe "GET show" do
    it "assigns the requested pricelist as @pricelist" do
      Pricelist.stub(:find).with("37") { mock_pricelist }
      get :show, :id => "37"
      assigns(:pricelist).should be(mock_pricelist)
    end
  end

  describe "GET new" do
    it "assigns a new pricelist as @pricelist" do
      Pricelist.stub(:new) { mock_pricelist }
      get :new
      assigns(:pricelist).should be(mock_pricelist)
    end
  end

  describe "GET edit" do
    it "assigns the requested pricelist as @pricelist" do
      Pricelist.stub(:find).with("37") { mock_pricelist }
      get :edit, :id => "37"
      assigns(:pricelist).should be(mock_pricelist)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pricelist as @pricelist" do
        Pricelist.stub(:new).with({'these' => 'params'}) { mock_pricelist(:save => true) }
        post :create, :pricelist => {'these' => 'params'}
        assigns(:pricelist).should be(mock_pricelist)
      end

      it "redirects to the created pricelist" do
        Pricelist.stub(:new) { mock_pricelist(:save => true) }
        post :create, :pricelist => {}
        response.should redirect_to(pricelist_url(mock_pricelist))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pricelist as @pricelist" do
        Pricelist.stub(:new).with({'these' => 'params'}) { mock_pricelist(:save => false) }
        post :create, :pricelist => {'these' => 'params'}
        assigns(:pricelist).should be(mock_pricelist)
      end

      it "re-renders the 'new' template" do
        Pricelist.stub(:new) { mock_pricelist(:save => false) }
        post :create, :pricelist => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pricelist" do
        Pricelist.should_receive(:find).with("37") { mock_pricelist }
        mock_pricelist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pricelist => {'these' => 'params'}
      end

      it "assigns the requested pricelist as @pricelist" do
        Pricelist.stub(:find) { mock_pricelist(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pricelist).should be(mock_pricelist)
      end

      it "redirects to the pricelist" do
        Pricelist.stub(:find) { mock_pricelist(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pricelist_url(mock_pricelist))
      end
    end

    describe "with invalid params" do
      it "assigns the pricelist as @pricelist" do
        Pricelist.stub(:find) { mock_pricelist(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pricelist).should be(mock_pricelist)
      end

      it "re-renders the 'edit' template" do
        Pricelist.stub(:find) { mock_pricelist(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pricelist" do
      Pricelist.should_receive(:find).with("37") { mock_pricelist }
      mock_pricelist.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pricelists list" do
      Pricelist.stub(:find) { mock_pricelist }
      delete :destroy, :id => "1"
      response.should redirect_to(pricelists_url)
    end
  end

end
