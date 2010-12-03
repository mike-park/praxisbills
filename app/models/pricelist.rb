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
  has_many :therapies, :dependent => :destroy
  validates_presence_of :start_date

  def name
    "#{start_date.to_s}: #{note}"
  end
end
