require 'spec_helper'

describe AuthsController do

  def mock_auth(stubs={})
    @mock_auth ||= mock_model(Auth, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all auths as @auths" do
      Auth.stub(:all) { [mock_auth] }
      get :index
      assigns(:auths).should eq([mock_auth])
    end
  end

  describe "GET show" do
    it "assigns the requested auth as @auth" do
      Auth.stub(:find).with("37") { mock_auth }
      get :show, :id => "37"
      assigns(:auth).should be(mock_auth)
    end
  end

  describe "GET new" do
    it "assigns a new auth as @auth" do
      Auth.stub(:new) { mock_auth }
      get :new
      assigns(:auth).should be(mock_auth)
    end
  end

  describe "GET edit" do
    it "assigns the requested auth as @auth" do
      Auth.stub(:find).with("37") { mock_auth }
      get :edit, :id => "37"
      assigns(:auth).should be(mock_auth)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created auth as @auth" do
        Auth.stub(:new).with({'these' => 'params'}) { mock_auth(:save => true) }
        post :create, :auth => {'these' => 'params'}
        assigns(:auth).should be(mock_auth)
      end

      it "redirects to the created auth" do
        Auth.stub(:new) { mock_auth(:save => true) }
        post :create, :auth => {}
        response.should redirect_to(auth_url(mock_auth))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved auth as @auth" do
        Auth.stub(:new).with({'these' => 'params'}) { mock_auth(:save => false) }
        post :create, :auth => {'these' => 'params'}
        assigns(:auth).should be(mock_auth)
      end

      it "re-renders the 'new' template" do
        Auth.stub(:new) { mock_auth(:save => false) }
        post :create, :auth => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested auth" do
        Auth.should_receive(:find).with("37") { mock_auth }
        mock_auth.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :auth => {'these' => 'params'}
      end

      it "assigns the requested auth as @auth" do
        Auth.stub(:find) { mock_auth(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:auth).should be(mock_auth)
      end

      it "redirects to the auth" do
        Auth.stub(:find) { mock_auth(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(auth_url(mock_auth))
      end
    end

    describe "with invalid params" do
      it "assigns the auth as @auth" do
        Auth.stub(:find) { mock_auth(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:auth).should be(mock_auth)
      end

      it "re-renders the 'edit' template" do
        Auth.stub(:find) { mock_auth(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested auth" do
      Auth.should_receive(:find).with("37") { mock_auth }
      mock_auth.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the auths list" do
      Auth.stub(:find) { mock_auth }
      delete :destroy, :id => "1"
      response.should redirect_to(auths_url)
    end
  end

end
