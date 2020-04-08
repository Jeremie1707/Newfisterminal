class AddIncomingTransportRefToInAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :in_assignments, :incoming_transport_ref, :string
  end
end
