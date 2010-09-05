class CreateAuths < ActiveRecord::Migration
  def self.up
    create_table :auths do |t|
      t.string :krankenkasse
      t.string :doctor
      t.integer :max_sessions, :default => 0
      t.boolean :billed, :default => false
      t.references :patient, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :auths
  end
end
