class LoadIn < ApplicationRecord
  before_create :set_reference, :formating_truck_nr, :formating_trailer_nr
  validates :reference, uniqueness: true
  include PgSearch::Model
  belongs_to :t1_customer
  has_many :in_assignments, dependent: :destroy
  accepts_nested_attributes_for :in_assignments
  validates :t1_customer_id, :presence => { :message => "Please Select a Customer" }

  pg_search_scope :global_search, against: [:reference, :status, :truck_nr, :trailer_nr,:total_weight, :arrival_date, :type_of_service ], associated_against: {
      in_assignments: [:reference, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet],
      t1_customer: [:name]
     },
      using: {
        tsearch: { prefix: true }
      }

  private

  def set_reference
    if LoadIn.last.nil?
      self.reference = "10001-LI"
    else
      self.reference = (LoadIn.last.id.to_i + 10001).to_s + "-LI"
    end
  end

  def formating_truck_nr
    self.truck_nr = self.truck_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
  end

  def formating_trailer_nr
    self.trailer_nr = self.trailer_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
  end
end
