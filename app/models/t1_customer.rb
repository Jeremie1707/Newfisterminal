class T1Customer < ApplicationRecord
  has_one :t1_customer_address
  has_many :load_ins
  has_many :load_outs
  has_many :users
end
