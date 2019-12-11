class CreateOutAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :out_assignments do |t|
      t.string :reference
      t.references :in_assignment, foreign_key: true
      t.references :load_out, foreign_key: true
      t.references :recipient, foreign_key: true
      t.string :lot_nr
      t.string :other_ref
      t.integer :number_of_boxe
      t.integer :number_of_pallet
      t.integer :net_weight
      t.integer :cost
      t.integer :div_cost

      t.timestamps
    end
  end
end
