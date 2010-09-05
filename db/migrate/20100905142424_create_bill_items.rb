class CreateBillItems < ActiveRecord::Migration
  def self.up
    create_table :bill_items do |t|
      t.references :auth
      t.references :therapy
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_items
  end
end
