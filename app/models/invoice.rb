# == Schema Information
# Schema version: 20100907104405
#
# Table name: invoices
#
#  id         :integer         not null, primary key
#  sent_date  :date            not null
#  created_at :datetime
#  updated_at :datetime
#  open       :boolean         default(TRUE)
#

class Invoice < ActiveRecord::Base
  has_many :auths, :dependent => :destroy
  has_many :payments, :order => "rec_date", :dependent => :destroy

  scope :paid, :conditions => { :open => false }
  scope :unpaid, :conditions => { :open => true }

  validates_presence_of :sent_date
  attr_accessible :sent_date, :open

  def select_name
    sent_date
  end

  # summary information, derived from sub tables
  def billed_amount
    auths.map(&:total).sum || 0
  end

  def received_amount
    payments.map(&:amount).sum || 0
  end

  def owed_to_us
    billed_amount - received_amount
  end

  # class versions, working with a collection of invoices
  def self.billed_amount(invoices)
    invoices.map(&:billed_amount).sum
  end

  def self.received_amount(invoices)
    invoices.map(&:received_amount).sum
  end

  def self.owed_to_us(invoices)
    self.billed_amount(invoices) - self.received_amount(invoices)
  end
end
