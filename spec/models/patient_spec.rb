require 'spec_helper'

describe Patient do
  it "should have current_insurer" do
    patient = FactoryGirl.create(:patient)
    auth1 = FactoryGirl.create(:auth, :patient => patient)
    auth2 = FactoryGirl.create(:auth, :patient => patient)
    patient.current_insurer.should == auth2.insurer
  end
end

# == Schema Information
#
# Table name: patients
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)     not null
#  dob        :date
#  created_at :datetime
#  updated_at :datetime
#

