class LoadOut < ApplicationRecord
  before_create :formating_truck_nr, :formating_trailer_nr
  validates :reference, uniqueness: true
  include PgSearch::Model
  belongs_to :t1_customer
  has_many :out_assignments, dependent: :destroy
  accepts_nested_attributes_for :out_assignments
  validates :t1_customer_id, :presence => { :message => "Please Select a Customer" }

  pg_search_scope :global_search, against: [:reference, :status, :truck_nr, :trailer_nr, :departure_date, :type_of_service ], associated_against: {
      out_assignments: [:reference, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet],
      t1_customer: [:name]
     },
      using: {
        tsearch: { prefix: true }
      }
  scope :load_out_filter_by_status, -> (status) { where status: status }
  scope :load_out_filter_by_last_week, lambda { where("departure_date >= ? AND departure_date <= ?", 1.week.ago, Time.now) }
  scope :load_out_filter_by_start_date, lambda {|start_date| where("departure_date >= ? ", start_date )}
  scope :load_out_filter_by_end_date, lambda {|end_date| where("departure_date <= ? ", end_date )}
  scope :load_out_filter_by_t1_customer, -> (t1_customer_id) { where t1_customer_id: t1_customer_id }
  scope :load_out_filter_by_truck_nr, -> (truck_nr) { where truck_nr: truck_nr }
  scope :load_out_filter_by_trailer_nr, -> (trailer_nr) { where trailer_nr: trailer_nr }
  scope :load_out_filter_by_type_of_service, -> (type_of_service) { where type_of_service: type_of_service }
  scope :load_out_filter_by_total_weight, -> (total_weight) { where total_weight: total_weight }



  def set_reference
    self.reference = (self.id.to_i).to_s + "-LO"
    self.save
  end

  private

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
