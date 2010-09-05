require 'spec_helper'

describe "invoices/new.html.erb" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :new_record? => true
    ))
  end

  it "renders new invoice form" do
    render

    rendered.should have_selector("form", :action => invoices_path, :method => "post") do |form|
    end
  end
end
