require 'spec_helper'

describe Auth do
  context "validations" do
    subject { FactoryGirl.build(:auth) }

    it { should be_valid }
    it "should be invalid" do
      subject.patient = nil
      should_not be_valid
    end
    it "should be invalid" do
      subject.insurer = nil
      should_not be_valid
    end
  end

  it "should have latest auth first" do
    patient = FactoryGirl.create(:patient)
    auth1 = FactoryGirl.create(:auth, :patient => patient)
    auth2 = FactoryGirl.create(:auth, :patient => patient)
    Auth.by_most_recent.first.should == auth2
  end
end

# == Schema Information
#
# Table name: auths
#
#  id           :integer         not null, primary key
#  doctor       :string(255)
#  max_sessions :integer         default(0)
#  billed       :boolean         default(FALSE)
#  patient_id   :integer         not null
#  created_at   :datetime
#  updated_at   :datetime
#  invoice_id   :integer
#  rec_amount   :decimal(, )
#  insurer_id   :integer         not null
#

