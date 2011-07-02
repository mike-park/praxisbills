require 'spec_helper'

describe Pricelist do
  context "#deep_clone" do
    let(:p1) do
      p1 = FactoryGirl.create(:pricelist)
      p1.therapies << FactoryGirl.create(:therapy, :pricelist => p1)
      p1.therapies << FactoryGirl.create(:therapy, :pricelist => p1)
      p1
    end
    
    subject { p2 = p1.deep_clone; p2.save!; p2 }
    
    it { should be_kind_of(Pricelist) }
    it { subject.start_date.should == Date.current }
    it { subject.note.should =~ /Duplicate/ }
    it { subject.therapies.count.should == 2 }
    it { subject.therapies.count.should == p1.therapies.count }
  end
end

# == Schema Information
#
# Table name: pricelists
#
#  id         :integer         not null, primary key
#  start_date :date            not null
#  note       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

