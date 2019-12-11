class CreateInAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :in_assignments do |t|
      t.string :reference
      t.references :load_in, foreign_key: true
      t.references :packer, foreign_key: true
      t.string :lot_nr
      t.string :incoming_order_ref
      t.string :other_ref
      t.integer :number_of_boxe
      t.integer :number_of_pallet

      t.timestamps
    end
  end
end
