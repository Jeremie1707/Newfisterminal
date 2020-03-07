class RemoveOutAssignmentsToInAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :out_assignments, :in_assignment
  end
end
