require 'spec_helper'

describe "payments/edit.html.erb" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :new_record? => false,
      :invoice => nil,
      :amount => "9.99"
    ))
  end

  it "renders the edit payment form" do
    render

    rendered.should have_selector("form", :action => payment_path(@payment), :method => "post") do |form|
      form.should have_selector("input#payment_invoice", :name => "payment[invoice]")
      form.should have_selector("input#payment_amount", :name => "payment[amount]")
    end
  end
end
