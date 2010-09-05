# == Schema Information
# Schema version: 20100905144037
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
#

class Auth < ActiveRecord::Base
  belongs_to :patient
end
