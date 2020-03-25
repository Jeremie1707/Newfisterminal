class OutAssignment < ApplicationRecord
  before_create :set_default
  validates :reference, uniqueness: true
  has_one :assignment, dependent: :destroy
  belongs_to :load_out
  belongs_to :recipient, optional: true

  def set_reference
    self.reference = (self.id.to_i).to_s + "-OUTA"
    self.save
  end

  private
  def set_default
    self.recipient_id ||= 1
  end
end
