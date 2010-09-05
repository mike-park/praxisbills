require 'spec_helper'

describe "auths/index.html.erb" do
  before(:each) do
    assign(:auths, [
      stub_model(Auth,
        :krankenkasse => "Krankenkasse",
        :doctor => "Doctor",
        :max_sessions => 1,
        :billed => false,
        :patient => nil
      ),
      stub_model(Auth,
        :krankenkasse => "Krankenkasse",
        :doctor => "Doctor",
        :max_sessions => 1,
        :billed => false,
        :patient => nil
      )
    ])
  end

  it "renders a list of auths" do
    render
    rendered.should have_selector("tr>td", :content => "Krankenkasse".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Doctor".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
  end
end
