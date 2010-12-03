require 'spec_helper'

describe InsurersController do

  def mock_insurer(stubs={})
    (@mock_insurer ||= mock_model(Insurer).as_null_object).tap do |insurer|
      insurer.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all insurers as @insurers" do
      Insurer.stub(:all) { [mock_insurer] }
      get :index
      assigns(:insurers).should eq([mock_insurer])
    end
  end

  describe "GET show" do
    it "assigns the requested insurer as @insurer" do
      Insurer.stub(:find).with("37") { mock_insurer }
      get :show, :id => "37"
      assigns(:insurer).should be(mock_insurer)
    end
  end

  describe "GET new" do
    it "assigns a new insurer as @insurer" do
      Insurer.stub(:new) { mock_insurer }
      get :new
      assigns(:insurer).should be(mock_insurer)
    end
  end

  describe "GET edit" do
    it "assigns the requested insurer as @insurer" do
      Insurer.stub(:find).with("37") { mock_insurer }
      get :edit, :id => "37"
      assigns(:insurer).should be(mock_insurer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created insurer as @insurer" do
        Insurer.stub(:new).with({'these' => 'params'}) { mock_insurer(:save => true) }
        post :create, :insurer => {'these' => 'params'}
        assigns(:insurer).should be(mock_insurer)
      end

      it "redirects to the created insurer" do
        Insurer.stub(:new) { mock_insurer(:save => true) }
        post :create, :insurer => {}
        response.should redirect_to(insurer_url(mock_insurer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved insurer as @insurer" do
        Insurer.stub(:new).with({'these' => 'params'}) { mock_insurer(:save => false) }
        post :create, :insurer => {'these' => 'params'}
        assigns(:insurer).should be(mock_insurer)
      end

      it "re-renders the 'new' template" do
        Insurer.stub(:new) { mock_insurer(:save => false) }
        post :create, :insurer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested insurer" do
        Insurer.should_receive(:find).with("37") { mock_insurer }
        mock_insurer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :insurer => {'these' => 'params'}
      end

      it "assigns the requested insurer as @insurer" do
        Insurer.stub(:find) { mock_insurer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:insurer).should be(mock_insurer)
      end

      it "redirects to the insurer" do
        Insurer.stub(:find) { mock_insurer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(insurer_url(mock_insurer))
      end
    end

    describe "with invalid params" do
      it "assigns the insurer as @insurer" do
        Insurer.stub(:find) { mock_insurer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:insurer).should be(mock_insurer)
      end

      it "re-renders the 'edit' template" do
        Insurer.stub(:find) { mock_insurer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested insurer" do
      Insurer.should_receive(:find).with("37") { mock_insurer }
      mock_insurer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the insurers list" do
      Insurer.stub(:find) { mock_insurer }
      delete :destroy, :id => "1"
      response.should redirect_to(insurers_url)
    end
  end

end
