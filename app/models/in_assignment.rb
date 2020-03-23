class InAssignment < ApplicationRecord
  validates :reference, uniqueness: true
  validates :packer, allow_blank: true, format: { with: /\A[A-Z]{1,2}-\d{1,5}\z/, message: "please enter the packer number in correct format : 'LETTER(1-2)-numbers' " }
  belongs_to :load_in
  # belongs_to :packer
  has_many :assignments, dependent: :destroy

  def set_reference
    self.reference = (self.id.to_i).to_s + "-INA"
    self.save
  end

end

