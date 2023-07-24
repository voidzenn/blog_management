class ApplicationController < ActionController::Base
  helper_method :category_list

  def category_list
    @category_list ||= Category.all
  end
end
