ActiveAdmin.register User do
  permit_params :email,:t1_customer_id, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :t1_customer_id
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  filter :email
  filter :t1_customer_id, as: :select,collection: proc { T1Customer.all }
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :t1_customer_id
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
