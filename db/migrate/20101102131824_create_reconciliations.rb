class CreateReconciliations < ActiveRecord::Migration
  def self.up
    add_column :auths, :rec_amount, :decimal, :precision => 8, :scale => 2
    add_column :auths, :payment_id, :integer
    add_column :payments, :notes, :text
  end

  def self.down
    remove_columns :auths, :rec_amount, :payment_id
    remove_column :payments, :notes
  end
end
