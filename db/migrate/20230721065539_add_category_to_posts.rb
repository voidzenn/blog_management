class AddCategoryToPosts < ActiveRecord::Migration[7.0]
  def up
    add_column :posts, :category, :integer, foreign_key: true, after: :title
  end

  def down
    remove_column :posts, :category, :integer, foreign_key: true, after: :title
  end
end
