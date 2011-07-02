# == Schema Information
# Schema version: 20101103211555
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  invoice_id :integer         not null
#  rec_date   :date            not null
#  amount     :decimal(8, 2)   not null
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#

class Payment < ActiveRecord::Base
  belongs_to :invoice
  has_many :auths, :through => :invoice

  validates_presence_of :invoice, :rec_date, :amount
  validates_numericality_of :amount

  attr_accessible :invoice_id, :rec_date, :amount, :auths_attributes, :notes
  accepts_nested_attributes_for :auths, :reject_if => :all_blank

  # sum of a collection of payments
  def self.amount(payments)
    payments.map(&:amount).sum
  end

end
