class AddNetWeighttoInAssignments < ActiveRecord::Migration[5.2]
  def change
     add_column :in_assignments, :net_weight, :integer
  end
end
