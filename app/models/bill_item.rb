class BillItem < ActiveRecord::Base
  belongs_to :auth
  belongs_to :therapy
end
