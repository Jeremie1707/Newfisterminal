class DropT1CustomerAdresses < ActiveRecord::Migration[5.2]
  def change
    drop_table :t1_customer_addresses
  end
end
