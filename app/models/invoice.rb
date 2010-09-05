# == Schema Information
# Schema version: 20100905144037
#
# Table name: invoices
#
#  id         :integer         not null, primary key
#  sent_date  :date            not null
#  created_at :datetime
#  updated_at :datetime
#

class Invoice < ActiveRecord::Base
  has_many :auths
  has_many :payments
end
