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

  form do |f|
    f.inputs do
      f.input :author_id, as: :select, collection: User.all.map{ |user| ["#{user.first_name} #{user.last_name}", user.id] }, include_blank:false
      f.input :category_id, as: :select, collection: categories_collection,
              selected: selected_category_id, include_blank: false
      f.input :cover_image, as: :file
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
