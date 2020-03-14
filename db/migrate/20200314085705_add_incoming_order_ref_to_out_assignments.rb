class AddIncomingOrderRefToOutAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :out_assignments, :incoming_order_ref, :string
  end
end
