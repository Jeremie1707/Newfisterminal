class AddTripRefToLoadIns < ActiveRecord::Migration[5.2]
  def change
    add_column :load_ins, :trip_ref, :string
  end
end
