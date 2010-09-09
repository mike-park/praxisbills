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

  validates_presence_of :code, :price, :description, :valid_from

  validates_uniqueness_of :code

  def select_name
    "#{code} #{short_description || description}".truncate(45)
  end
end
