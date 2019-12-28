class InAssignment < ApplicationRecord
  belongs_to :load_in
  # belongs_to :packer
  has_many :out_assignments
end
