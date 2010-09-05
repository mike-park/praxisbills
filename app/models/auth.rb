# == Schema Information
# Schema version: 20100905145132
#
# Table name: auths
#
#  id           :integer         not null, primary key
#  krankenkasse :string(255)
#  doctor       :string(255)
#  max_sessions :integer         default(0)
#  billed       :boolean
#  patient_id   :integer         not null
#  created_at   :datetime
#  updated_at   :datetime
#  invoice_id   :integer
#

class Auth < ActiveRecord::Base
  belongs_to :patient
  belongs_to :invoice

  has_many :bill_items
end
