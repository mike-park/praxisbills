require 'spec_helper'

describe BillItem do
  subject { FactoryGirl.build(:bill_item) }

  it { should be_valid }
  [:auth, :therapy, :quantity].each do |item|
    it "should not be valid without #{item}" do
      subject.send("#{item}=", nil)
      subject.should_not be_valid
    end
  end
end

# == Schema Information
#
# Table name: bill_items
#
#  id         :integer         not null, primary key
#  auth_id    :integer         not null
#  therapy_id :integer         not null
#  quantity   :integer         not null
#  unit_price :decimal(8, 2)   not null
#  total      :decimal(8, 2)   not null
#  created_at :datetime
#  updated_at :datetime
#

