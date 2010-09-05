class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
