class Packer < ApplicationRecord
has_one :address, as: :addressable
end
