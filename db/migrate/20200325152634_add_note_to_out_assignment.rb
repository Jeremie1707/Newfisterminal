class AddNoteToOutAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :out_assignments, :note, :text
  end
end
