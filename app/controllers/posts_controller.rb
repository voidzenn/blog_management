class PostsController < ApplicationController
  def index
    @posts = published_posts

    if params[:page].present?
      @post_card_id = params[:page].to_i

      return respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.after("post_card_#{params[:page].to_i - 1}", partial: "posts/content")
        end
      end
    end

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
      @posts = Post.search(params[:query], params[:page] || 1, params[:per_page] || 12)
                   .records
    else
      @posts = published_posts
    end

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("posts", partial: "posts/content")
      end
    end
  end

  private

  def published_posts
    @published_posts ||= Post.page(params[:page] || 1).per(params[:per_page] || 12)
                             .published
                             .sort_recent
  end
end
