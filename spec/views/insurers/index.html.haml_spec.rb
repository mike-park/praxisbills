require 'spec_helper'

describe "insurers/index.html.haml" do
  before(:each) do
    assign(:insurers, [
      stub_model(Insurer,
        :abbr => "Abbr",
        :name => "Name",
        :active_pricelist => ""
      ),
      stub_model(Insurer,
        :abbr => "Abbr",
        :name => "Name",
        :active_pricelist => ""
      )
    ])
  end

  it "renders a list of insurers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
