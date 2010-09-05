require 'spec_helper'

describe "therapies/index.html.erb" do
  before(:each) do
    assign(:therapies, [
      stub_model(Therapy,
        :code => 1,
        :price => "9.99",
        :short_description => "Short Description",
        :description => "MyText"
      ),
      stub_model(Therapy,
        :code => 1,
        :price => "9.99",
        :short_description => "Short Description",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of therapies" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Short Description".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
