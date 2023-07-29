class HomeController < ApplicationController
  def index
    @posts = Post.joins(:category).where(status: :published)
    render '/home'
  end
end
