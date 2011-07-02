# == Schema Information
# Schema version: 20101203131904
#
# Table name: therapies
#
#  id                :integer         not null, primary key
#  code              :integer         not null
#  price             :decimal(, )     default(0.0), not null
#  short_description :string(255)
#  description       :text
#  valid_from        :date
#  created_at        :datetime
#  updated_at        :datetime
#  pricelist_id      :integer
#

class Therapy < ActiveRecord::Base
  has_many :bill_items
  belongs_to :pricelist, :inverse_of => :therapies

  validates_presence_of :code, :short_description, :pricelist
  validates_numericality_of :price
  validates_uniqueness_of :code, :scope => :pricelist_id

  def select_name
    "#{code} #{short_description || description}".truncate(45)
  end
end
