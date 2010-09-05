class CreateBillItems < ActiveRecord::Migration
  def self.up
    create_table :bill_items do |t|
      t.references :auth, :null => false
      t.references :therapy, :null => false
      t.integer :quantity, :null => false
      t.decimal :unit_price, :precision => 8, :scale => 2, :null => false
      t.decimal :total, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_items
  end
end
