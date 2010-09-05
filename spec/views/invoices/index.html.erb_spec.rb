require 'spec_helper'

describe "invoices/index.html.erb" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice),
      stub_model(Invoice)
    ])
  end

  it "renders a list of invoices" do
    render
  end
end
