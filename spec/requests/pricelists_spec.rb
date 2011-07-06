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
      save_and_open_page
      click_link "Duplicate"
      page.should have_content("Duplicate of")
    end
  end

  describe "PUT /pricelists/1" do
    it "edits a pricelist" do
      pricelist = FactoryGirl.create(:pricelist, :note => 'IKK pricelist')
      FactoryGirl.create(:therapy, :pricelist => pricelist)
      visit pricelists_path
      page.should have_content("IKK pricelist")
      click_link "Edit"
      page.should have_content("Start date")
      page.should have_selector("#pricelist_note")
      page.should have_selector("#pricelist_therapies_attributes_0_price")
    end
  end
end
