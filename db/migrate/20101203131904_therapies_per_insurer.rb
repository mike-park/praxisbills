class TherapiesPerInsurer < ActiveRecord::Migration
  def self.up
    add_column :therapies, :pricelist_id, :integer
    change_column :therapies, :price, :decimal, :precision => 8, :scale => 2, :default => 0.00, :null => false

    create_table :insurers do |t|
      t.string :abbr, :null => false
      t.string :name, :null => false
      t.integer :active_pricelist_id

      t.timestamps
    end
    create_table :pricelists do |t|
      t.date :start_date, :null => false
      t.string :note

      t.timestamps
    end
    create_table :insurers_pricelists, :id => false do |t|
      t.integer :insurer_id, :null => false
      t.integer :pricelist_id, :null => false
    end
  end

  def self.down
    remove_columns :therapies, :pricelist_id
    drop_table :pricelists
    drop_table :insurers
    drop_table :insurers_pricelists
  end
end
