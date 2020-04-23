ActiveAdmin.register T1Customer do
menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
actions :index, :show, :new, :create, :edit, :update

  permit_params :name,
  address_attributes:[:street, :street_nr, :postcode, :city, :country, :phone_nr]

  filter :name, as: :select
  filter :created_at
  filter :updated_at



  form title: 'Create a T1Customer' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do
    f.input :name
    f.has_many( :address, { class: 'has_one' }) do |t1_customer_address|
      t1_customer_address.input :street
      t1_customer_address.input :street_nr
      t1_customer_address.input :postcode
      t1_customer_address.input :city
      t1_customer_address.input :country
      t1_customer_address.input :phone_nr
      end
    end
      actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
