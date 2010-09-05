require 'spec_helper'

describe "invoices/edit.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :new_record? => false
    ))
  end

  it "renders the edit invoice form" do
    render

    rendered.should have_selector("form", :action => invoice_path(@invoice), :method => "post") do |form|
    end
  end
end
