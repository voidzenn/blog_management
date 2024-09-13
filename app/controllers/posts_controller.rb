class PostsController < ApplicationController
  def index
    @posts = published_posts

    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @post = Post.find_by slug: params[:slug]

    respond_to do |format|
      format.html { render :show }
    end
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
        render turbo_stream: turbo_stream.append("posts", partial: "posts/content", locals: { posts: @posts })
      end
    end
  end

  private

  def published_posts
    @published_posts ||= Post.published
  end
end
