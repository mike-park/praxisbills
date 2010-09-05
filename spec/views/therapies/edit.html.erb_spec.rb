require 'spec_helper'

describe "therapies/edit.html.erb" do
  before(:each) do
    @therapy = assign(:therapy, stub_model(Therapy,
      :new_record? => false,
      :code => 1,
      :price => "9.99",
      :short_description => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit therapy form" do
    render

    rendered.should have_selector("form", :action => therapy_path(@therapy), :method => "post") do |form|
      form.should have_selector("input#therapy_code", :name => "therapy[code]")
      form.should have_selector("input#therapy_price", :name => "therapy[price]")
      form.should have_selector("input#therapy_short_description", :name => "therapy[short_description]")
      form.should have_selector("textarea#therapy_description", :name => "therapy[description]")
    end
  end
end
