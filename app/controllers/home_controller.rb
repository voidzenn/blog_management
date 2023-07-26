class HomeController < ApplicationController
  def index
    @posts = Post.where(status: :published)
    render '/home'
  end
end
