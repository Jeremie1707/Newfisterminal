class AddOrderIndextoOutAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :out_assignments, :order_index, :integer
  end
end
