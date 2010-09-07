class AddOpenToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :open, :boolean, :default => true
  end

  def self.down
    remove_column :invoices, :open
  end
end
