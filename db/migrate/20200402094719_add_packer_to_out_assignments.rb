class AddPackerToOutAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :out_assignments, :packer, :string
  end
end
