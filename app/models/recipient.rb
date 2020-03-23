class Recipient < ApplicationRecord
  has_many :out_assignments
  has_one :address, as: :addressable
end
