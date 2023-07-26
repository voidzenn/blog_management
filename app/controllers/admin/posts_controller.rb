module Admin
  class PostsController < ActiveAdmin::ResourceController
    def create
      @post = Post.new post_params

      if params[:commit] == I18n.t("active_admin.posts.forms.actions.save_draft")
        save_as_draft
      else
        super do |format|
          redirect_to_admin_post(resource, notice: I18n.t("active_admin.posts.response.message.success.published"))
          return
        end
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :author_id, :category_id, :status)
    end

    def redirect_to_admin_post resource, notice: ""
      redirect_to admin_post_path(resource), notice: notice
    end

    def save_as_draft
      @post.status = :drafted

      if @post.save
        redirect_to_admin_post(@post, notice: I18n.t("active_admin.posts.response.message.success.drafted"))
      else
        render :new
      end
    end
  end
end
