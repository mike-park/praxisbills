require 'spec_helper'

describe "pricelists/new.html.haml" do
  before(:each) do
    assign(:pricelist, stub_model(Pricelist,
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new pricelist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pricelists_path, :method => "post" do
      assert_select "input#pricelist_note", :name => "pricelist[note]"
    end
  end
end
