class AddIncomingTransportRefToOutAssignments < ActiveRecord::Migration[5.2]
  def change
      add_column :out_assignments, :incoming_transport_ref, :string
  end
end
