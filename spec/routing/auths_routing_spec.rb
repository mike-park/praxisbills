require "spec_helper"

describe AuthsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/auths" }.should route_to(:controller => "auths", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/auths/new" }.should route_to(:controller => "auths", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/auths/1" }.should route_to(:controller => "auths", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/auths/1/edit" }.should route_to(:controller => "auths", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/auths" }.should route_to(:controller => "auths", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/auths/1" }.should route_to(:controller => "auths", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/auths/1" }.should route_to(:controller => "auths", :action => "destroy", :id => "1")
    end

  end
end
