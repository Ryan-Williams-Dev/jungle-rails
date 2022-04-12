class MakeEmailUniquenessCaseInsensitive < ActiveRecord::Migration
  def change
    enable_extension :citext
    change_column :users, :email, :citext
  end
end
