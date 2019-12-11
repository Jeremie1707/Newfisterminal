class AddT1CustomerRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :t1_customer, foreign_key: true
  end
end
