require "spec_helper"

describe PricelistsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pricelists" }.should route_to(:controller => "pricelists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pricelists/new" }.should route_to(:controller => "pricelists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pricelists/1" }.should route_to(:controller => "pricelists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pricelists/1/edit" }.should route_to(:controller => "pricelists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pricelists" }.should route_to(:controller => "pricelists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pricelists/1" }.should route_to(:controller => "pricelists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pricelists/1" }.should route_to(:controller => "pricelists", :action => "destroy", :id => "1")
    end

  end
end
