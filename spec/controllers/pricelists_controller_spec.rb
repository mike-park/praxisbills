require 'spec_helper'

describe PricelistsController do
  describe "POST clone" do
    let(:p2) do
      p1 = double("Pricelist")
      p2 = double("Pricelist")
      p1.stub(:deep_clone).and_return(p2)
      Pricelist.stub(:find).with(42).and_return(p1)
      p2
    end
    
    it "should fail" do
      p2.stub(:save).and_return(false)
      post :clone, :id => 42
      response.should redirect_to(pricelists_url)
      flash[:alert].should match(/not/)
    end
    it "should succeed" do
      p2.stub(:save).and_return(true)
      post :clone, :id => 42
      response.should redirect_to(pricelists_url)
      flash[:notice].should match(/clone/)
    end
  end
end
