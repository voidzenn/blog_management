require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do
  let(:admin_user) { create(:admin_user) }
  let(:category) { create :category }

  before do
    sign_in admin_user
  end

  shared_examples "update post with valid params" do
    let(:post) { create :post }

    it do
      expect {
        put :update, params: { id: post.id, post: params }
      }.to change(Post, :count).by(1)
      expect(assigns(:post)).to be_persisted

      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to eq post
    end
  end

  describe "GET #show" do
    context 'when find post success' do
      let(:post) { create :post }

      before do
        get :show, params: { id: post.id }
      end

      it 'should have same post as created' do
        expect(assigns(:post)).to eq(post)
        expect(response).to have_http_status(200)
      end
    end

    context "when find post failed" do
      before do
        allow(Post).to receive_message_chain(:friendly, :find).and_return(nil)

        get :show, params: { id: 0 }
      end

      it 'should return nil' do
        expect(assigns(:post)).to be_nil
      end
    end
  end

  describe "POST #create" do
    context 'when saving as "draft"' do
      context 'when saved successfully' do
        let(:params) do
          {
            title: "title",
            content: "content",
            category_id: category.id,
            author_id: admin_user.id,
          }
        end

        it 'create a new post with status "drafted"' do
          expect {
            post :create, params: { post: params, commit: I18n.t("active_admin.posts.forms.actions.save_draft") }
          }.to change(Post, :count).by(1)

          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
          expect(assigns(:post).status).to eq "drafted"

          expect(response).to redirect_to(admin_post_path(assigns(:post)))
        end
      end

      context 'when save failed' do
        context 'when author_id is missing' do
          let(:params) do
            {
              title: "title",
              content: "content",
              category_id: category.id,
            }
          end

          it 'should have error message must exist and cant be blank' do
            expect {
              post :create, params: { post: params }
            }.to change(Post, :count).by(0)

            expect(assigns(:post).errors[:author]).to include("must exist")
            expect(assigns(:post).errors[:author_id]).to include("can't be blank")
          end
        end
      end
    end

    context 'when saving as "publish"' do
      let(:params) do
        {
          title: "title",
          content: "content",
          category_id: category.id,
          author_id: admin_user.id,
        }
      end

      it 'create a new post with status "published"' do
        expect {
          post :create, params: { post: params }
        }.to change(Post, :count).by(1)

        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
        expect(assigns(:post).status).to eq "published"

        expect(response).to redirect_to(admin_post_path(assigns(:post)))
      end
    end
  end

  describe "PUT #edit" do
    context "when find post success" do
      let(:post) { create :post }

      before do
        put :edit, params: { id: post }
      end

      it do
        expect(assigns(:post)).to eq post
      end
    end

    context "when cant find post" do
      before do
        allow(Post).to receive_message_chain(:friendly, :find).and_return(nil)

        put :edit, params: { id: 0 }
      end

      it do
        expect(assigns(:post)).to be_nil
      end
    end
  end

  describe "PUT #update" do
    context "when update success" do
      it_behaves_like "update post with valid params" do
        let(:params) {{ title: "title" }}
      end
      it_behaves_like "update post with valid params" do
        let(:params) {{ content: "content"}}
      end
      it_behaves_like "update post with valid params" do
        let(:params) {{ author_id: 2 }}
      end
      it_behaves_like "update post with valid params" do
        let(:params) {{ category_id: 2 }}
      end
    end

    context "when update failed" do
      context "when cant find post" do
        before do
          allow(Post).to receive_message_chain(:friendly, :find).and_return(nil)

          put :update, params: { id: 0, post: {} }
        end

        it do
          expect(assigns(:post)).to be_nil
        end
      end
    end
  end
end
