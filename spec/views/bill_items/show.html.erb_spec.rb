require 'spec_helper'

describe "bill_items/show.html.erb" do
  before(:each) do
    @bill_item = assign(:bill_item, stub_model(BillItem,
      :auth => nil,
      :therapy => nil,
      :quantity => 1,
      :unit_price => "9.99",
      :total => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(nil.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("9.99".to_s)
    rendered.should contain("9.99".to_s)
  end
end
