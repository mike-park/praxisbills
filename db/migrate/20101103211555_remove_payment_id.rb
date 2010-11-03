class RemovePaymentId < ActiveRecord::Migration
  def self.up
    remove_column :auths, :payment_id
  end

  def self.down
    add_column :auths, :payment_id, :integer
  end
end
