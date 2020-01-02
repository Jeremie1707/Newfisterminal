class OutAssignment < ApplicationRecord
  before_create :set_reference
  validates :reference, uniqueness: true
  belongs_to :in_assignment
  belongs_to :load_out
  belongs_to :recipient

  private
  def set_reference
    if OutAssignment.last.nil?
       self.reference = "10001-OUTA"
    else
     self.reference = (OutAssignment.last.id.to_i + 10001).to_s + "-OUTA"
    end
  end
end
