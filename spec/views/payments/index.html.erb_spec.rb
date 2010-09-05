require 'spec_helper'

describe "payments/index.html.erb" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :invoice => nil,
        :amount => "9.99"
      ),
      stub_model(Payment,
        :invoice => nil,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of payments" do
    render
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
  end
end
