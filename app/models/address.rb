class Address < ApplicationRecord
  belongs_to :adressable, polymorphic: true, optional:true
end
