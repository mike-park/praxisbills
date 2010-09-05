require 'spec_helper'

describe "payments/new.html.erb" do
  before(:each) do
    assign(:payment, stub_model(Payment,
      :new_record? => true,
      :invoice => nil,
      :amount => "9.99"
    ))
  end

  it "renders new payment form" do
    render

    rendered.should have_selector("form", :action => payments_path, :method => "post") do |form|
      form.should have_selector("input#payment_invoice", :name => "payment[invoice]")
      form.should have_selector("input#payment_amount", :name => "payment[amount]")
    end
  end
end
