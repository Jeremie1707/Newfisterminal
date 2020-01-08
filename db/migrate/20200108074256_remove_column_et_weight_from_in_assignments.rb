class RemoveColumnEtWeightFromInAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :in_assignments, :et_weight, :integer
  end
end
