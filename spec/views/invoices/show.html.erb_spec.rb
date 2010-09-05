require 'spec_helper'

describe "invoices/show.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice))
  end

  it "renders attributes in <p>" do
    render
  end
end
