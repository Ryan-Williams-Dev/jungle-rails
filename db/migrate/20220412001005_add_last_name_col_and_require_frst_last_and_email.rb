class AddLastNameColAndRequireFrstLastAndEmail < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :email, false
  end

end
