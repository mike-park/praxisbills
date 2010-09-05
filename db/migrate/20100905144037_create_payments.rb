class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.references :invoice, :null => false
      t.date :rec_date, :null => false
      t.decimal :amount, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
