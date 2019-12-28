class LoadIn < ApplicationRecord
  before_create :set_reference
  validates :reference, uniqueness: true
  include PgSearch::Model
  belongs_to :t1_customer
  has_many :in_assignments
  accepts_nested_attributes_for :in_assignments

  pg_search_scope :global_search, against: [:reference, :status, :truck_nr, :trailer_nr, :arrival_date ], associated_against: {
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

end
