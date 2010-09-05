require 'spec_helper'

describe "auths/new.html.erb" do
  before(:each) do
    assign(:auth, stub_model(Auth,
      :new_record? => true,
      :krankenkasse => "MyString",
      :doctor => "MyString",
      :max_sessions => 1,
      :billed => false,
      :patient => nil
    ))
  end

  it "renders new auth form" do
    render

    rendered.should have_selector("form", :action => auths_path, :method => "post") do |form|
      form.should have_selector("input#auth_krankenkasse", :name => "auth[krankenkasse]")
      form.should have_selector("input#auth_doctor", :name => "auth[doctor]")
      form.should have_selector("input#auth_max_sessions", :name => "auth[max_sessions]")
      form.should have_selector("input#auth_billed", :name => "auth[billed]")
      form.should have_selector("input#auth_patient", :name => "auth[patient]")
    end
  end
end
