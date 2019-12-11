class LoadOut < ApplicationRecord
  belongs_to :t1_customer
  has_many :out_assignments
end
