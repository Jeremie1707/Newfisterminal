class ChangeTotalWeightToBeFloatInLoadIn < ActiveRecord::Migration[5.2]
  def change
    change_column :load_ins, :total_weight, :float
  end
end
