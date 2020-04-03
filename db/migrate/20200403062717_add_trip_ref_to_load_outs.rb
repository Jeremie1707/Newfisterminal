class AddTripRefToLoadOuts < ActiveRecord::Migration[5.2]
  def change
    add_column :load_outs, :trip_ref, :string
  end
end
