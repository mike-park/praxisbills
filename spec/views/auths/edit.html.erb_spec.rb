require 'spec_helper'

describe "auths/edit.html.erb" do
  before(:each) do
    @auth = assign(:auth, stub_model(Auth,
      :new_record? => false,
      :krankenkasse => "MyString",
      :doctor => "MyString",
      :max_sessions => 1,
      :billed => false,
      :patient => nil
    ))
  end

  it "renders the edit auth form" do
    render

    rendered.should have_selector("form", :action => auth_path(@auth), :method => "post") do |form|
      form.should have_selector("input#auth_krankenkasse", :name => "auth[krankenkasse]")
      form.should have_selector("input#auth_doctor", :name => "auth[doctor]")
      form.should have_selector("input#auth_max_sessions", :name => "auth[max_sessions]")
      form.should have_selector("input#auth_billed", :name => "auth[billed]")
      form.should have_selector("input#auth_patient", :name => "auth[patient]")
    end
  end
end
