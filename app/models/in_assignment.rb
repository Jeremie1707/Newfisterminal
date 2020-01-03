class InAssignment < ApplicationRecord
  before_create :set_reference
  validates :reference, uniqueness: true
  belongs_to :load_in
  # belongs_to :packer
  has_many :out_assignments

  private
  def set_reference
    if InAssignment.last.nil?
       self.reference = "10001-INA"
    else
     self.reference = (InAssignment.last.id.to_i + 10001).to_s + "-INA"
    end
  end
end
