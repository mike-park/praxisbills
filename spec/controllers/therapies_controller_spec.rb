require 'spec_helper'

describe TherapiesController do

  def mock_therapy(stubs={})
    @mock_therapy ||= mock_model(Therapy, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all therapies as @therapies" do
      Therapy.stub(:all) { [mock_therapy] }
      get :index
      assigns(:therapies).should eq([mock_therapy])
    end
  end

  describe "GET show" do
    it "assigns the requested therapy as @therapy" do
      Therapy.stub(:find).with("37") { mock_therapy }
      get :show, :id => "37"
      assigns(:therapy).should be(mock_therapy)
    end
  end

  describe "GET new" do
    it "assigns a new therapy as @therapy" do
      Therapy.stub(:new) { mock_therapy }
      get :new
      assigns(:therapy).should be(mock_therapy)
    end
  end

  describe "GET edit" do
    it "assigns the requested therapy as @therapy" do
      Therapy.stub(:find).with("37") { mock_therapy }
      get :edit, :id => "37"
      assigns(:therapy).should be(mock_therapy)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created therapy as @therapy" do
        Therapy.stub(:new).with({'these' => 'params'}) { mock_therapy(:save => true) }
        post :create, :therapy => {'these' => 'params'}
        assigns(:therapy).should be(mock_therapy)
      end

      it "redirects to the created therapy" do
        Therapy.stub(:new) { mock_therapy(:save => true) }
        post :create, :therapy => {}
        response.should redirect_to(therapy_url(mock_therapy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved therapy as @therapy" do
        Therapy.stub(:new).with({'these' => 'params'}) { mock_therapy(:save => false) }
        post :create, :therapy => {'these' => 'params'}
        assigns(:therapy).should be(mock_therapy)
      end

      it "re-renders the 'new' template" do
        Therapy.stub(:new) { mock_therapy(:save => false) }
        post :create, :therapy => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested therapy" do
        Therapy.should_receive(:find).with("37") { mock_therapy }
        mock_therapy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :therapy => {'these' => 'params'}
      end

      it "assigns the requested therapy as @therapy" do
        Therapy.stub(:find) { mock_therapy(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:therapy).should be(mock_therapy)
      end

      it "redirects to the therapy" do
        Therapy.stub(:find) { mock_therapy(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(therapy_url(mock_therapy))
      end
    end

    describe "with invalid params" do
      it "assigns the therapy as @therapy" do
        Therapy.stub(:find) { mock_therapy(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:therapy).should be(mock_therapy)
      end

      it "re-renders the 'edit' template" do
        Therapy.stub(:find) { mock_therapy(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested therapy" do
      Therapy.should_receive(:find).with("37") { mock_therapy }
      mock_therapy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the therapies list" do
      Therapy.stub(:find) { mock_therapy }
      delete :destroy, :id => "1"
      response.should redirect_to(therapies_url)
    end
  end

end
