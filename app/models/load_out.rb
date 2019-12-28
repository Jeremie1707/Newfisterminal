class LoadOut < ApplicationRecord
  before_create :set_reference
  validates :reference, uniqueness: true
  belongs_to :t1_customer
  has_many :out_assignments

  private
    def set_reference
      if LoadOut.last.nil?
        self.reference = "50001-LO"
      else
       self.reference = (LoadOut.last.id.to_i + 50001).to_s + "-LO"
      end
    end
end
