# == Schema Information
# Schema version: 20100905144037
#
# Table name: therapies
#
#  id                :integer         not null, primary key
#  code              :integer         not null
#  price             :decimal(8, 2)   default(0.0), not null
#  short_description :string(255)
#  description       :text
#  valid_from        :date
#  created_at        :datetime
#  updated_at        :datetime
#

class Therapy < ActiveRecord::Base
  has_many :bill_items
end
