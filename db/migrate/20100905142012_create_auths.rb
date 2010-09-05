class CreateAuths < ActiveRecord::Migration
  def self.up
    create_table :auths do |t|
      t.string :krankenkasse
      t.string :doctor
      t.integer :max_sessions
      t.boolean :billed
      t.references :patient

      t.timestamps
    end
  end

  def self.down
    drop_table :auths
  end
end
