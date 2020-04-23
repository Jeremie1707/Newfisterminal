ActiveAdmin.register User do
  permit_params :email,:t1_customer_id,:first_name, :last_name, :password, :password_confirmation
menu priority: 5

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :t1_customer_id
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  filter :email
  filter :last_name
  filter :t1_customer_id, as: :select,collection: proc { T1Customer.all }
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :t1_customer_id
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

 controller do
      def update_resource(object, attributes)
        update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
        object.send(update_method, *attributes)
      end
    end
end
