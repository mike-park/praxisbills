require 'spec_helper'

describe "pricelists/show.html.haml" do
  before(:each) do
    @pricelist = assign(:pricelist, stub_model(Pricelist,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Note/)
  end
end
