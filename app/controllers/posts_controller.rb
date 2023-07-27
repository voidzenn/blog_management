class PostsController < ApplicationController
  def show
    @post = Post.friendly.find params[:slug]
    render :show
  end
end
