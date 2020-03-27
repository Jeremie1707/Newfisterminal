ActiveAdmin.register Packer do

  permit_params :packer_nr,
                :name,
                address_attributes:[:street, :street_nr, :postcode, :city, :country, :phone_nr]


  filter :packer_nr, as: :select
  filter :name


  form title: 'Create a Packer' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do
    f.input :packer_nr
    f.input :name
    f.has_many( :address, { class: 'has_one' }) do |packer_address|
      packer_address.input :street
      packer_address.input :street_nr
      packer_address.input :postcode
      packer_address.input :city
      packer_address.input :country
      packer_address.input :phone_nr
      end
    end
      actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:packer_nr, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
