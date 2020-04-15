class T1Customer < ApplicationRecord

  has_many :load_ins
  has_many :load_outs
  has_many :users
  has_one :address, as: :addressable
  # validates :address, presence: true
  accepts_nested_attributes_for :address, :allow_destroy => true
end
