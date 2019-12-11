class CreateLoadOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :load_outs do |t|
      t.string :reference
      t.references :t1_customer, foreign_key: true
      t.string :status
      t.datetime :departure_date
      t.string :truck_nr
      t.string :trailer_nr
      t.string :type_of_service

      t.timestamps
    end
  end
end
