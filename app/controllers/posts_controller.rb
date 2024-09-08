class PostsController < ApplicationController
  def search
    if params[:query].present?
      @posts = Post.search(params[:query])
    else
      @posts = Post.all
    end

    render json: @posts, status: :ok
  end

  def show
    @post = Post.friendly.find params[:slug]
    render :show
  end
end
