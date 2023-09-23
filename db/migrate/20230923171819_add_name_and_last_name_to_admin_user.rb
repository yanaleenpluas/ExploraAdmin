class AddNameAndLastNameToAdminUser < ActiveRecord::Migration[7.0]
  def up 
    add_column :admin_users, :name, :string, :null => false, :default => "Alexander"
    add_column :admin_users, :last_name, :string, :null => false, :default => "Goussas"
  end

  def down
    remove_column :admin_users, :name
    remove_column :admin_users, :last_name
  end
end
