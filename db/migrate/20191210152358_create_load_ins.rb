class CreateLoadIns < ActiveRecord::Migration[5.2]
  def change
    create_table :load_ins do |t|
      t.string :reference
      t.references :t1_customer, foreign_key: true
      t.string :status
      t.datetime :arrival_date
      t.string :truck_nr
      t.string :trailer_nr
      t.string :type_of_service

      t.timestamps
    end
  end
end
