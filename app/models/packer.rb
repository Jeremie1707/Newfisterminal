class Packer < ApplicationRecord
has_one :address, as: :addressable
validates :packer_nr, format: { with: /\A[A-Z]{1,2}-\d{1,5}\z/, message: "please enter the packer number in correct format : 'LETTER(1-2)-numbers' " }
# validates :address, presence: true
accepts_nested_attributes_for :address, :allow_destroy => true
end
