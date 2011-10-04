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

  scope :paid, where(:open => false).order('sent_date desc')
  scope :unpaid, where(:open => true).order('sent_date asc')

  validates_presence_of :sent_date
  attr_accessible :sent_date, :open

  delegate :billed_amount, :received_amount, :owed_to_us, :to => :auths

  def self.billed_amount
    scoped.joins(:auths => [:bill_items]).sum('bill_items.total').to_f
  end

  def self.received_amount
    scoped.joins(:auths).sum('auths.rec_amount').to_f
  end

  def self.owed_to_us
    billed_amount - received_amount
  end

  def select_name
    sent_date
  end
end
