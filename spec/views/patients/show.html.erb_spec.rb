require 'spec_helper'

describe "patients/show.html.erb" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("First Name".to_s)
    rendered.should contain("Last Name".to_s)
  end
end
