require 'spec_helper'

describe Auth do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: auths
#
#  id           :integer         not null, primary key
#  doctor       :string(255)
#  max_sessions :integer         default(0)
#  billed       :boolean         default(FALSE)
#  patient_id   :integer         not null
#  created_at   :datetime
#  updated_at   :datetime
#  invoice_id   :integer
#  rec_amount   :decimal(, )
#  insurer_id   :integer         not null
#

