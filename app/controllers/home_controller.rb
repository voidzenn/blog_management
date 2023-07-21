class HomeController < ApplicationController
  def index
    @posts = Post.all
    render '/home'
  end
end
