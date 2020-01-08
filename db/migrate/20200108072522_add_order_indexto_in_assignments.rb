class AddOrderIndextoInAssignments < ActiveRecord::Migration[5.2]
  def change
   add_column :in_assignments, :order_index, :integer
  end
end
