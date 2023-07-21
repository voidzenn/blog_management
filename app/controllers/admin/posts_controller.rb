module Admin
  class PostsController < ActiveAdmin::ResourceController
    before_action :set_collections, only: %i(new)

    def new
      @post = Post.new
    end

    private

    def set_collections
      authors_collection
      categories_collection
      @selected_author_id = @authors_collection.first&.second
      @selected_category_id = @categories_collection.first&.second
    end

    def authors_collection
      @authors_collection = AdminUser.pluck :name, :id
    end

    def categories_collection
      @categories_collection = Category.pluck :name, :id
    end
  end
end
