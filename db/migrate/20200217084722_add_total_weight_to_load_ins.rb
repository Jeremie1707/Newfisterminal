class AddTotalWeightToLoadIns < ActiveRecord::Migration[5.2]
  def change
    add_column :load_ins, :total_weight, :integer
  end
end
