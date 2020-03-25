class AddRecipientRefToInAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :in_assignments, :recipient, foreign_key: true
  end
end
