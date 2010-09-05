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
end
