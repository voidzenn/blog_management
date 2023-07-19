class Post < ApplicationRecord
  belongs_to :author, class_name: "AdminUser", foreign_key: "author_id"

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "content", "created_at", "id", "status", "title", "updated_at"]
  end
end
