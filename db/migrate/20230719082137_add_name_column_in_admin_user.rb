class AddNameColumnInAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :name, :string, after: :encrypted_password
  end
end
