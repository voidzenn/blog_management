class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  belongs_to :author, class_name: "AdminUser", foreign_key: "author_id"
  belongs_to :category

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :author_id, presence: true
  validates :category_id, presence: true

  enum status: {
    drafted: 0,
    published: 1,
    trashed: 2,
  }

  before_create :set_default_status

  settings do
    mappings dynamic: false do
      indexes :title, type: :text
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: [:title]
          }
        }
      }
    )
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "author_id", "category_id", "title", "content", "created_at", "status", "updated_at"]
    super + ["slug"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["author", "category"]
  end

  private

  def set_default_status
    self.status ||= :published
  end

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
