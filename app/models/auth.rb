# == Schema Information
# Schema version: 20101203131904
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
#  rec_amount   :decimal(8, 2)
#

class Auth < ActiveRecord::Base
  belongs_to :patient
  belongs_to :invoice
  belongs_to :insurer

  has_many :bill_items, :order => "created_at", :dependent => :destroy

  default_scope includes(:patient).order('patients.last_name')

  validates_presence_of :patient_id, :insurer_id
  
  validates_uniqueness_of :patient_id,
                          :scope => "invoice_id",
                          :if => :invoice_id,
                          :message => 'is already referenced by this invoice'
  validates_numericality_of :rec_amount, :unless => "rec_amount.blank?"

  attr_accessible :doctor, :max_sessions, :billed,
  :patient_id, :invoice_id, :rec_amount, :insurer_id

  # summary information from sub tables
  def total
    bill_items.sum(:total) || 0
  end

  def maximum_quantity
    bill_items.maximum(:quantity) || 0
  end

  def diff
    (rec_amount || 0) - total
  end
  
  # summary information over a collection of auths
  def self.total(auths)
    auths.map(&:total).sum
  end

  def self.quantity(auths)
    auths.map(&:maximum_quantity).sum
  end

  def self.max_sessions(auths)
    auths.sum(:max_sessions)
  end

  def self.rec_amount(auths)
    auths.sum(:rec_amount)
  end
  
  def self.diff(auths)
    auths.sum(:rec_amount) - self.total(auths)
  end
  
  # order auths by patient name alphabetically
  def <=>(other)
    patient.select_name.casecmp(other.patient.select_name)
  end
end
