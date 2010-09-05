require 'spec_helper'

describe "therapies/show.html.erb" do
  before(:each) do
    @therapy = assign(:therapy, stub_model(Therapy,
      :code => 1,
      :price => "9.99",
      :short_description => "Short Description",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("9.99".to_s)
    rendered.should contain("Short Description".to_s)
    rendered.should contain("MyText".to_s)
  end
end
