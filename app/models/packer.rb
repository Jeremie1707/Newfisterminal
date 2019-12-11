class Packer < ApplicationRecord
has_one :packer_address
has_many :in_assignments
end
