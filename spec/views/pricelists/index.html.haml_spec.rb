require 'spec_helper'

describe "pricelists/index.html.haml" do
  before(:each) do
    assign(:pricelists, [
      stub_model(Pricelist,
        :note => "Note"
      ),
      stub_model(Pricelist,
        :note => "Note"
      )
    ])
  end

  it "renders a list of pricelists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
