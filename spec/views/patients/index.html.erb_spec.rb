require 'spec_helper'

describe "patients/index.html.erb" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      stub_model(Patient,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of patients" do
    render
    rendered.should have_selector("tr>td", :content => "First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Last Name".to_s, :count => 2)
  end
end
