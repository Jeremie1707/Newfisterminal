class User < ApplicationRecord
  belongs_to :t1_customer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
