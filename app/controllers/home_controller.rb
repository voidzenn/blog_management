class HomeController < ApplicationController
  def search
    if params[:query].present?
      @posts = Post.search(params[:query])
                   .map{ |post| post._source }
    else
      @posts = Post.all
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("posts", partial: "posts/posts_search", locals: { posts: @posts })
      end
    end
  end

  def index
    @posts = Post.joins(:category).published
    render '/home'
  end
end
