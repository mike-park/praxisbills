require 'spec_helper'

describe "insurers/edit.html.haml" do
  before(:each) do
    @insurer = assign(:insurer, stub_model(Insurer,
      :abbr => "MyString",
      :name => "MyString",
      :active_pricelist => ""
    ))
  end

  it "renders the edit insurer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurer_path(@insurer), :method => "post" do
      assert_select "input#insurer_abbr", :name => "insurer[abbr]"
      assert_select "input#insurer_name", :name => "insurer[name]"
      assert_select "input#insurer_active_pricelist", :name => "insurer[active_pricelist]"
    end
  end
end
