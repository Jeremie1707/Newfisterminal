class CreateT1CustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :t1_customer_addresses do |t|
      t.string :street
      t.string :street_nr
      t.string :postcode
      t.string :city
      t.string :country
      t.string :phone_nr
      t.references :t1_customer, foreign_key: true

      t.timestamps
    end
  end
end
