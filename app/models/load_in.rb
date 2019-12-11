class LoadIn < ApplicationRecord
  belongs_to :t1_customer
  has_many :in_assignments
end
