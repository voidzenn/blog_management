ActiveAdmin.register Post do
  permit_params :title, :content, :author_id, :category_id, :cover_image

  # Fix cover image ransack issue
  remove_filter :cover_image_attachment
  remove_filter :cover_image_blob

  index do
    selectable_column
    id_column
    column :author.name.capitalize
    column :title
    column :status
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :author
      row :category
      row :cover_image do |post|
        image_tag(url_for(post.cover_image), size: "400x200") if post.cover_image.attached?
      end
      row :title
      row :content do |post|
        raw post.content
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :author_id, as: :select, collection: User.all.map{ |user| ["#{user.first_name} #{user.last_name}", user.id] }, include_blank:false
      f.input :category_id, as: :select, collection: categories_collection,
              selected: selected_category_id, include_blank: false
      f.input :cover_image, as: :file
      if f.object.cover_image.attached?
        li do
          span do
            label "‎" # Hidden character to fix cover image margin
          end
          span do
            image_tag(url_for(post.cover_image), size: "400x200") if post.cover_image.attached?
          end
        end
      end
      f.input :title
      f.input :content, as: :quill_editor, input_html: {
        data: {
          options: {
            modules: {
              toolbar:
                [
                  [{"header": [1, 2, 3, 4, false]}],
                  ["bold", "italic", "underline"],
                  ['blockquote', 'code-block'],
                  [{ 'align': [] }],
                  ["link", "image"],
                ]
              },
            placeholder: "Type something...",
            theme: "snow",
          }
        }
      }
    end

    f.actions do
      f.action :submit, label: action_label("publish")
      f.cancel_link

      if controller.action_name == "new"
        div class: "right-action" do
          f.action :submit, label: action_label("save_draft")
        end
      end
    end

  end
end
