ActiveAdmin.register Post do
  permit_params :title, :content, :author_id, :category_id

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
      f.input :author_id, as: :select, collection: AdminUser.pluck(:name, :id)
      f.input :category_id, as: :select, collection: Category.pluck(:name, :id)
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
    f.actions
  end

end
