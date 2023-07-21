class AddNameColumnInAdminUser < ActiveRecord::Migration[7.0]
  def up
    add_column :admin_users, :name, :string, after: :encrypted_password
  end

  def down
    remove_column :admin_users, :name, :string, after: :encrypted_password
  end
end
