class LoadIn < ApplicationRecord
  enum status: { out: 0, in: 1, done: 2 }
  enum type_of_service: { truck_to_truck: 0, truck_terminal_truck: 1, picking: 2 }
  before_create :formating_truck_nr, :formating_trailer_nr
  validates :reference, uniqueness: true
  include PgSearch::Model
  belongs_to :t1_customer
  has_many :in_assignments, dependent: :destroy
  has_paper_trail
  accepts_nested_attributes_for :in_assignments
  validates :t1_customer_id, :presence => { :message => "Please Select a Customer" }
  validates :arrival_date, :presence => { :message => "Please Select a Date" }

  pg_search_scope :global_search, against: [:reference, :status, :truck_nr, :trailer_nr,:total_weight, :arrival_date, :type_of_service, :total_weight, :trip_ref], associated_against: {
      in_assignments: [:reference, :lot_nr, :incoming_order_ref,:incoming_transport_ref, :other_ref, :number_of_boxe, :number_of_pallet, :packer],
      t1_customer: [:name]
     },
      using: {
        tsearch: { prefix: true }
      }
  scope :load_in_filter_by_status, -> (status) { where status: status }
  scope :load_in_filter_by_remove_done, lambda { where("status <> ?", 2) }
  scope :load_in_filter_by_last_week, lambda { where("arrival_date >= ? AND arrival_date <= ?", 1.week.ago, Time.now) }
  scope :load_in_filter_by_start_date, lambda {|start_date| where("arrival_date >= ? ", start_date )}
  scope :load_in_filter_by_end_date, lambda {|end_date| where("arrival_date <= ? ", end_date )}
  scope :load_in_filter_by_t1_customer, -> (t1_customer_id) { where t1_customer_id: t1_customer_id }
  scope :load_in_filter_by_truck_nr, -> (truck_nr) { where truck_nr: truck_nr }
  scope :load_in_filter_by_trailer_nr, -> (trailer_nr) { where trailer_nr: trailer_nr }
  scope :load_in_filter_by_type_of_service, -> (type_of_service) { where type_of_service: type_of_service }
  scope :load_in_filter_by_total_weight, -> (total_weight) { where total_weight: total_weight }



  # scope :filter_by_date,  -> { (departure_date) { where departure_date:  } poster_for_summary.where(["`posters`.start_time <= ? AND `posters`.end_time >= ?", t = DateTime.now, t]) }

def set_reference
    self.reference = (self.id.to_i).to_s + "-LI"
    self.save
end

private
  def formating_truck_nr
    self.truck_nr = self.truck_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
  end

  def formating_trailer_nr
    self.trailer_nr = self.trailer_nr.upcase.gsub(/\s+|\W+|_/, "").split(/(?<=\D)(?=\d)|(?<=\d)(?=\D)/).join(" ")
  end

end
