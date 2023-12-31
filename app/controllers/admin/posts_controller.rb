module Admin
  class PostsController < ActiveAdmin::ResourceController
    before_action :find_post, only: %i(show edit update)

    def show
    end

    def create
      @post = Post.new post_params

      if save_as_draft?
        @post.status = :drafted
        save_post_with_message "drafted"
      else
        save_post_with_message "published"
      end
    end

    def edit
    end

    def update
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :author_id, :category_id, :status)
    end

    def find_post
      @post = Post.friendly.find params[:id]
    end

    def save_as_draft?
      params[:commit] == I18n.t("active_admin.posts.forms.actions.save_draft")
    end

    def save_post_with_message status
      if @post.save
        redirect_to admin_post_path(@post), notice: I18n.t("active_admin.posts.response.message.success.#{status}")
      else
        render :new
      end
    end
  end
end
