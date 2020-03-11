class InAssignment < ApplicationRecord
  before_create :set_reference
  validates :reference, uniqueness: true
  validates :packer, allow_blank: true, format: { with: /\A[A-Z]{1,2}-\d{1,5}\z/, message: "please enter the packer number in correct format : 'LETTER(1-2)-numbers' " }

  belongs_to :load_in
  # belongs_to :packer
  has_many :assignments, dependent: :destroy

  private

  def set_reference
    if InAssignment.last.nil?
      self.reference = "10001-INA"
    else
      self.reference = (InAssignment.last.id.to_i + 10001).to_s + "-INA"
    end
  end
end

