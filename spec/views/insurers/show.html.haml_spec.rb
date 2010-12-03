require 'spec_helper'

describe "insurers/show.html.haml" do
  before(:each) do
    @insurer = assign(:insurer, stub_model(Insurer,
      :abbr => "Abbr",
      :name => "Name",
      :active_pricelist => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Abbr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
