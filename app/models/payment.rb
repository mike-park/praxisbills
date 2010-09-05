# == Schema Information
# Schema version: 20100905144037
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  invoice_id :integer         not null
#  rec_date   :date            not null
#  amount     :decimal(8, 2)   not null
#  created_at :datetime
#  updated_at :datetime
#

class Payment < ActiveRecord::Base
  belongs_to :invoice
end
