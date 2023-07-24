class Post < ApplicationRecord
  belongs_to :author, class_name: "AdminUser", foreign_key: "author_id"
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :author_id, presence: true
  validates :category_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "author_id", "category_id", "title", "content", "created_at", "status", "updated_at"]
  end
end
