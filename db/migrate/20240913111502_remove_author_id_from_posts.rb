class RemoveAuthorIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :author_id, foreign_key: true
  end
end
