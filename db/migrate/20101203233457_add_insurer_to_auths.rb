class AddInsurerToAuths < ActiveRecord::Migration
  def self.up
    add_column :auths, :insurer_id, :integer
    remove_column :auths, :krankenkasse
    Auth.reset_column_information
    Auth.update_all(:insurer_id => 1)
    change_column :auths, :insurer_id, :integer, :null => false
  end

  def self.down
    remove_column :auths, :insurer_id
    add_column :auths, :krankenkasse, :string
  end
end
