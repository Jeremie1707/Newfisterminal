class LoadOut < ApplicationRecord
  before_create :set_reference, :formating_truck_nr, :formating_trailer_nr
  validates :reference, uniqueness: true
  belongs_to :t1_customer
  has_many :out_assignments, dependent: :destroy

  private
    def set_reference
      if LoadOut.last.nil?
        self.reference = "50001-LO"
      else
       self.reference = (LoadOut.last.id.to_i + 50001).to_s + "-LO"
      end
    end

  def formating_truck_nr
    if self.truck_nr != nil
    self.truck_nr = self.truck_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
    end
  end

  def formating_trailer_nr
    if self.trailer_nr != nil
    self.trailer_nr = self.trailer_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
    end
  end
end
