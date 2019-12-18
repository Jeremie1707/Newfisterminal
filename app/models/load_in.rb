class LoadIn < ApplicationRecord
  include PgSearch::Model
  belongs_to :t1_customer
  has_many :in_assignments

  pg_search_scope :global_search, against: [:reference, :status, :truck_nr, :trailer_nr, :arrival_date ], associated_against: {
      in_assignments: [:reference, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet],
      t1_customer: [:name]
     },
      using: {
        tsearch: { prefix: true }
      }
end
