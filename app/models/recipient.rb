class Recipient < ApplicationRecord
  has_one :recipient_address
  has_many :out_assignments
end
