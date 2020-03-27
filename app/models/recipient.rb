class Recipient < ApplicationRecord
  has_many :out_assignments
  has_many :in_assignments
  has_one :address, as: :addressable
  # validates :address, presence: true
  accepts_nested_attributes_for :address, :allow_destroy => true
end
