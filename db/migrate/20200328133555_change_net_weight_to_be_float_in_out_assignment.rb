class ChangeNetWeightToBeFloatInOutAssignment < ActiveRecord::Migration[5.2]
  def change
    change_column :out_assignments, :net_weight, :float
  end
end
