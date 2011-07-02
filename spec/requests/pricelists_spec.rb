require 'spec_helper'

describe "Pricelists" do
  describe "GET /pricelists" do
    it "display pricelists" do
      FactoryGirl.create(:pricelist, :note => 'IKK pricelist')
      visit pricelists_path
      #save_and_open_page
      page.should have_content("IKK pricelist")
    end
  end

  describe "POST /pricelists/1" do
    it "clones pricelist" do
      FactoryGirl.create(:pricelist, :note => 'IKK pricelist')
      visit pricelists_path
      page.should have_content("IKK pricelist")
      #save_and_open_page
      click_link "Duplicate"
      page.should have_content("Duplicate of")
    end
  end
end
