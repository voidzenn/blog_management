module Admin::PostHelper
  def authors_collection
    @authors_collection ||= AdminUser.pluck(:name, :id)
  end

  def categories_collection
    @categories_collection ||= Category.pluck(:name, :id)
  end

  def selected_author_id
    @authors_collection&.first&.second
  end

  def selected_category_id
    @categories_collection&.first&.second
  end
end
