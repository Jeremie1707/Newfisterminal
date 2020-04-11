ActiveAdmin.register Recipient do
menu priority: 4
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name,
                :email,
                address_attributes:[:street, :street_nr, :postcode, :city, :country, :phone_nr]

  filter :name, as: :select
  filter :email
  filter :created_at
  filter :updated_at

  form title: 'Create a Recipient' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do
    f.input :name
    f.input :email
    f.has_many( :address, { class: 'has_one' }) do |recipient_address|
      recipient_address.input :street
      recipient_address.input :street_nr
      recipient_address.input :postcode
      recipient_address.input :city
      recipient_address.input :country
      recipient_address.input :phone_nr
      end
    end
      actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
