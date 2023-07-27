class AddUniqueIndexToPostsTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :title, unique: true
  end
end
