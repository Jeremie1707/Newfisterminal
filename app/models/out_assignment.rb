class OutAssignment < ApplicationRecord
  validates :reference, uniqueness: true
  has_many :assignments, dependent: :destroy
  belongs_to :load_out
  belongs_to :recipient, optional: true

  def set_reference
    self.reference = (self.id.to_i).to_s + "-OUTA"
    self.save
  end
end
