require 'spec_helper'

describe Payment do
  pending "add some examples to (or delete) #{__FILE__}"
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

