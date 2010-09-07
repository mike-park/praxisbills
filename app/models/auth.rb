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

  has_many :bill_items, :order => "created_at", :dependent => :destroy

  validates_presence_of :patient_id
  validates_uniqueness_of :patient_id,
                          :scope => "invoice_id",
                          :if => :invoice_id,
                          :message => 'is already referenced by this invoice'

  attr_accessible :krankenkasse, :doctor, :max_sessions,
                  :billed, :patient_id, :invoice_id

  def total
    bill_items.sum(:total) || 0
  end

  def maximum_quantity
    bill_items.maximum(:quantity) || 0
  end

  def <=>(other)
    patient.select_name.casecmp(other.patient.select_name)
  end
end
