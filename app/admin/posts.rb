ActiveAdmin.register Post do
  permit_params :title, :content, :author_id

  form do |f|
    f.inputs do
      f.input :author_id, as: :select, collection: AdminUser.pluck(:name, :id)
      f.input :title
      f.input :content, as: :quill_editor
    end
    f.actions
  end
end
