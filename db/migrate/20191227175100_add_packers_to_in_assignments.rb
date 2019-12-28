class AddPackersToInAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :in_assignments, :packer, :string
  end
end
