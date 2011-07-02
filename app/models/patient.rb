# == Schema Information
# Schema version: 20100905144037
#
# Table name: patients
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)     not null
#  dob        :date
#  created_at :datetime
#  updated_at :datetime
#

class Patient < ActiveRecord::Base
  has_many :auths, :dependent => :destroy

  validates_presence_of :last_name
  
  validates_uniqueness_of :last_name,
                          :scope => "first_name",
                          :message => 'name already exists'

  before_save :strip_white_space

  # XXX is this sqlite only LOWER?
  default_scope order('LOWER(last_name)')
  
  def select_name
    [last_name, first_name].join(", ")
  end
  alias_method :to_label, :select_name 

  def strip_white_space
    first_name.strip! unless first_name.nil?
    last_name.strip!
  end

  def current_insurer
    auths.by_most_recent.first.try(:insurer)
  end
end
