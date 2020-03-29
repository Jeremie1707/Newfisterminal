class ChangeNetWeightToBeFloatInInAssignment < ActiveRecord::Migration[5.2]
  def change
    change_column :in_assignments, :net_weight, :float
  end
end
