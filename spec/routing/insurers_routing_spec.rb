require "spec_helper"

describe InsurersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/insurers" }.should route_to(:controller => "insurers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/insurers/new" }.should route_to(:controller => "insurers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/insurers/1" }.should route_to(:controller => "insurers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/insurers/1/edit" }.should route_to(:controller => "insurers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/insurers" }.should route_to(:controller => "insurers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/insurers/1" }.should route_to(:controller => "insurers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/insurers/1" }.should route_to(:controller => "insurers", :action => "destroy", :id => "1")
    end

  end
end
