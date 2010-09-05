require 'spec_helper'

describe "payments/show.html.erb" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :invoice => nil,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(nil.to_s)
    rendered.should contain("9.99".to_s)
  end
end
