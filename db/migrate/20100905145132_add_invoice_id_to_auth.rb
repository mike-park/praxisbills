class AddInvoiceIdToAuth < ActiveRecord::Migration
  def self.up
    add_column :auths, :invoice_id, :integer
  end

  def self.down
    remove_column :auths, :invoice
  end
end
