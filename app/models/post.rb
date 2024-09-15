class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  extend FriendlyId

  friendly_id :slug_candidates, use: [:slugged, :finders] # :finders is the fix for friendly_id admin_console

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category

  has_one_attached :cover_image

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

  scope :published, -> {
    where(status: :published)
  }

  scope :sort_recent, -> {
    order(created_at: :desc)
  }

  settings do
    mappings dynamic: false do
      indexes :title, type: :text
    end
  end

  def self.search(query, page = 1, per_page = 10)
    search_params = {
      query: {
        multi_match: {
          query: query,
          fields: [:title]
        }
      },
      from: (page - 1) * per_page,
      size: per_page
    }

    __elasticsearch__.search(search_params)
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
