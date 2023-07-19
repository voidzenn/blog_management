class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: {to_table: :admin_users}
      t.string :title
      t.string :content
      t.integer :status

      t.timestamps
    end
  end
end
