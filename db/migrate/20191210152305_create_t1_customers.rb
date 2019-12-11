class CreateT1Customers < ActiveRecord::Migration[5.2]
  def change
    create_table :t1_customers do |t|
      t.string :name


      t.timestamps
    end
  end
end
