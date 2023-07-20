class ChangePostContentToLongtext < ActiveRecord::Migration[7.0]
  def up
    change_column :posts, :content, :longtext
  end

  def down
    change_column :posts, :content, :string
  end
end
