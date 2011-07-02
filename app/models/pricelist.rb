# == Schema Information
# Schema version: 20101203131904
#
# Table name: pricelists
#
#  id         :integer         not null, primary key
#  start_date :date            not null
#  note       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pricelist < ActiveRecord::Base
  has_and_belongs_to_many :insurers
  has_many :therapies, :dependent => :destroy, :inverse_of => :pricelist
  validates_presence_of :start_date

  def name
    "#{start_date.to_s}: #{note}"
  end

  def deep_clone
    pricelist = Pricelist.new(:start_date => Date.current,
                              :note => "Duplicate of #{start_date.to_s(:de)}:#{note}")
    pricelist.therapies = therapies.collect do |therapy|
      clone = therapy.clone
      clone.pricelist_id = nil
      clone
    end
    pricelist
  end
end
