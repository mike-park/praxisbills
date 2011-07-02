require 'spec_helper'

describe Payment do
  subject { FactoryGirl.build(:payment) }

  it { should be_valid }
  [:invoice, :rec_date, :amount].each do |item|
    it "should not be valid without #{item}" do
      subject.send("#{item}=", nil)
      subject.should_not be_valid
    end
  end
end

# == Schema Information
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  invoice_id :integer         not null
#  rec_date   :date            not null
#  amount     :decimal(8, 2)   not null
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#

