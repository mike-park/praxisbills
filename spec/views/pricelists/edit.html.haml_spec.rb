require 'spec_helper'

describe "pricelists/edit.html.haml" do
  before(:each) do
    @pricelist = assign(:pricelist, stub_model(Pricelist,
      :note => "MyString"
    ))
  end

  it "renders the edit pricelist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pricelist_path(@pricelist), :method => "post" do
      assert_select "input#pricelist_note", :name => "pricelist[note]"
    end
  end
end
