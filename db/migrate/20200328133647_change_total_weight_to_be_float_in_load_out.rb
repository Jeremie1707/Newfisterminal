class ChangeTotalWeightToBeFloatInLoadOut < ActiveRecord::Migration[5.2]
  def change
    change_column :load_outs, :total_weight, :float
  end
end
