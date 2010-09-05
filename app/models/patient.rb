# == Schema Information
# Schema version: 20100905144037
#
# Table name: patients
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)     not null
#  dob        :date
#  created_at :datetime
#  updated_at :datetime
#

class Patient < ActiveRecord::Base
  has_many :auths
end
