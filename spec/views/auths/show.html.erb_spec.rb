require 'spec_helper'

describe "auths/show.html.erb" do
  before(:each) do
    @auth = assign(:auth, stub_model(Auth,
      :krankenkasse => "Krankenkasse",
      :doctor => "Doctor",
      :max_sessions => 1,
      :billed => false,
      :patient => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Krankenkasse".to_s)
    rendered.should contain("Doctor".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(nil.to_s)
  end
end
