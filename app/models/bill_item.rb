# == Schema Information
# Schema version: 20100905144037
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

class BillItem < ActiveRecord::Base
  belongs_to :auth
  belongs_to :therapy

  before_save :update_prices

  validates_presence_of :auth_id, :therapy_id, :quantity
  validates_numericality_of :quantity
  validates_uniqueness_of :therapy_id,
                          :scope => "auth_id",
                          :message => 'is already referenced by this authorization'

  attr_accessible :auth_id, :therapy_id, :quantity, :unit_price

  private
    def update_prices
      self.unit_price ||= therapy.price
      self.total = unit_price * quantity;
    end
end
