class AddCategoryToPosts < ActiveRecord::Migration[7.0]
  def up
    add_reference :posts, :category, foreign_key: true, after: :title
  end

  def down
    remove_reference :posts, :category, foreign_key: true, after: :title
  end
end
