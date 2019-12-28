class RemoveReference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :in_assignments, :packer, index:true, foreign_key: true
  end
end
