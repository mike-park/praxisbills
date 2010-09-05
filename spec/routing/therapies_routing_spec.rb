require "spec_helper"

describe TherapiesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/therapies" }.should route_to(:controller => "therapies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/therapies/new" }.should route_to(:controller => "therapies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/therapies/1" }.should route_to(:controller => "therapies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/therapies/1/edit" }.should route_to(:controller => "therapies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/therapies" }.should route_to(:controller => "therapies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/therapies/1" }.should route_to(:controller => "therapies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/therapies/1" }.should route_to(:controller => "therapies", :action => "destroy", :id => "1")
    end

  end
end
