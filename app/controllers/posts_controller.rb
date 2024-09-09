class PostsController < ApplicationController
  def index
    @posts = published_posts
  end

  def search
    if params[:query].present?
      @posts = Post.search(params[:query])
    else
      @posts = published_posts
    end

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("posts", partial: "posts/posts_search", locals: { posts: @posts })
      end
    end
  end

  def show
    @post = Post.friendly.find params[:slug]
    render :show
  end

  private

  def published_posts
    @published_posts ||= Post.published
  end
end
