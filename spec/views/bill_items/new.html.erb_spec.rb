require 'spec_helper'

describe "bill_items/new.html.erb" do
  before(:each) do
    assign(:bill_item, stub_model(BillItem,
      :new_record? => true,
      :auth => nil,
      :therapy => nil,
      :quantity => 1,
      :unit_price => "9.99",
      :total => "9.99"
    ))
  end

  it "renders new bill_item form" do
    render

    rendered.should have_selector("form", :action => bill_items_path, :method => "post") do |form|
      form.should have_selector("input#bill_item_auth", :name => "bill_item[auth]")
      form.should have_selector("input#bill_item_therapy", :name => "bill_item[therapy]")
      form.should have_selector("input#bill_item_quantity", :name => "bill_item[quantity]")
      form.should have_selector("input#bill_item_unit_price", :name => "bill_item[unit_price]")
      form.should have_selector("input#bill_item_total", :name => "bill_item[total]")
    end
  end
end
