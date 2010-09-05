require 'spec_helper'

describe "bill_items/index.html.erb" do
  before(:each) do
    assign(:bill_items, [
      stub_model(BillItem,
        :auth => nil,
        :therapy => nil,
        :quantity => 1,
        :unit_price => "9.99",
        :total => "9.99"
      ),
      stub_model(BillItem,
        :auth => nil,
        :therapy => nil,
        :quantity => 1,
        :unit_price => "9.99",
        :total => "9.99"
      )
    ])
  end

  it "renders a list of bill_items" do
    render
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
  end
end
