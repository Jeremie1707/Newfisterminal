class OutAssignment < ApplicationRecord
  belongs_to :in_assignment
  belongs_to :load_out
  belongs_to :recipient
end
