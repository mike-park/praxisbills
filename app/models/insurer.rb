# == Schema Information
# Schema version: 20101203131904
#
# Table name: insurers
#
#  id                  :integer         not null, primary key
#  abbr                :string(255)     not null
#  name                :string(255)     not null
#  active_pricelist_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Insurer < ActiveRecord::Base
  has_and_belongs_to_many :pricelists
  belongs_to :active_pricelist, :class_name => 'Pricelist'
  
  validates_presence_of :abbr, :name

  default_scope order('abbr')

  def to_label
    "#{abbr}: #{name}"
  end
end
