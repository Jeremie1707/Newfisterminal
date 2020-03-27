class InAssignment < ApplicationRecord
  before_create :set_default
  validates :reference, uniqueness: true
  validates :packer, allow_blank: true, format: { with: /\A[A-Z]{1,2}-\d{1,5}\z/, message: "please enter the packer number in correct format : 'LETTER(1-2)-numbers' " }
  belongs_to :load_in
  belongs_to :recipient, optional: true
  has_one :assignment, dependent: :destroy

  def set_reference
    self.reference = (self.id.to_i).to_s + "-INA"
    self.save
  end

  private
  def set_default
    self.recipient_id ||= 1
  end

end

