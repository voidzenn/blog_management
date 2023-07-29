module HomeHelper
  include BaseHelper

  def categories_selection
    @categories_selection ||= Category.all
  end

  def categories_collection_name
    @categories_collection_name = @categories_selection.pluck(:name).to_json.html_safe
  end
end
