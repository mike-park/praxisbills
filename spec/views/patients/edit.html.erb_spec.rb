require 'spec_helper'

describe "patients/edit.html.erb" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :new_record? => false,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit patient form" do
    render

    rendered.should have_selector("form", :action => patient_path(@patient), :method => "post") do |form|
      form.should have_selector("input#patient_first_name", :name => "patient[first_name]")
      form.should have_selector("input#patient_last_name", :name => "patient[last_name]")
    end
  end
end
