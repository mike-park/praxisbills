class AddFirstDateToAuth < ActiveRecord::Migration
  def change
    add_column :auths, :first_date, :date
    add_column :auths, :last_date, :date
  end
end
