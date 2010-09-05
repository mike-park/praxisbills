require 'spec_helper'

describe "patients/new.html.erb" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :new_record? => true,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders new patient form" do
    render

    rendered.should have_selector("form", :action => patients_path, :method => "post") do |form|
      form.should have_selector("input#patient_first_name", :name => "patient[first_name]")
      form.should have_selector("input#patient_last_name", :name => "patient[last_name]")
    end
  end
end
