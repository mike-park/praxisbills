require 'spec_helper'

describe Therapy do
end

# == Schema Information
#
# Table name: therapies
#
#  id                :integer         not null, primary key
#  code              :integer         not null
#  price             :decimal(, )     default(0.0), not null
#  short_description :string(255)
#  description       :text
#  valid_from        :date
#  created_at        :datetime
#  updated_at        :datetime
#  pricelist_id      :integer
#

