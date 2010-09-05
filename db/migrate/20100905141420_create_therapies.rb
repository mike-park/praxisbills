class CreateTherapies < ActiveRecord::Migration
  def self.up
    create_table :therapies do |t|
      t.integer :code
      t.decimal :price
      t.string :short_description
      t.text :description
      t.date :valid_from

      t.timestamps
    end
  end

  def self.down
    drop_table :therapies
  end
end
