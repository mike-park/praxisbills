require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :crypted_password => "Crypted Password"
      ),
      stub_model(User,
        :email => "Email",
        :crypted_password => "Crypted Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Crypted Password".to_s, :count => 2)
  end
end
