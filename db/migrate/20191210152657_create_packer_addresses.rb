class CreatePackerAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :packer_addresses do |t|
      t.string :street
      t.string :street_nr
      t.string :postcode
      t.string :city
      t.string :country
      t.string :phone_nr
      t.references :packer, foreign_key: true

      t.timestamps
    end
  end
end
