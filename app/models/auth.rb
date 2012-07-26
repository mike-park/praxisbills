class Auth < ActiveRecord::Base
  belongs_to :patient
  belongs_to :invoice
  belongs_to :insurer

  has_many :bill_items, :order => "created_at", :dependent => :destroy

  scope :by_name, includes(:patient).order('patients.last_name, patients.first_name')
  scope :by_most_recent, order('auths.updated_at DESC')

  validates_presence_of :patient, :insurer

# sometimes we bill the same person more than once per invoice
#  validates_uniqueness_of :patient_id,
#                          :scope => "invoice_id",
#                          :if => :invoice_id,
#                          :message => 'is already referenced by this invoice'
  
  validates_numericality_of :rec_amount, :unless => "rec_amount.blank?"

  attr_accessible :doctor, :max_sessions, :billed, :first_date, :last_date,
  :patient_id, :invoice_id, :rec_amount, :insurer_id, :bill_items_attributes

  delegate :billed_amount, :maximum_quantity, :to => :bill_items

  accepts_nested_attributes_for :bill_items

  def self.billed_amount
    scoped.joins(:bill_items).sum('bill_items.total').to_f
  end

  def self.received_amount
    scoped.sum(:rec_amount).to_f
  end
  
  def self.quantity
    scoped.map {|auth| auth.bill_items.maximum_quantity}.sum
  end

  def self.max_sessions
    scoped.sum(:max_sessions).to_i
  end

  def self.owed_to_us
    billed_amount - received_amount
  end
  
  # order auths by patient name alphabetically
  def <=>(other)
    patient.select_name.casecmp(other.patient.select_name)
  end

  def invoice_date
    invoice.try(:sent_date)
  end

  def received_amount
    rec_amount || 0.0
  end
  
  def owed_to_us
    received_amount - billed_amount
  end
end

# == Schema Information
#
# Table name: auths
#
#  id           :integer         not null, primary key
#  doctor       :string(255)
#  max_sessions :integer         default(0)
#  billed       :boolean         default(FALSE)
#  patient_id   :integer         not null
#  created_at   :datetime
#  updated_at   :datetime
#  invoice_id   :integer
#  rec_amount   :decimal(, )
#  insurer_id   :integer         not null
#

