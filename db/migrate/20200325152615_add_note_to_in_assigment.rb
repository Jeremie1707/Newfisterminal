class AddNoteToInAssigment < ActiveRecord::Migration[5.2]
  def change
    add_column :in_assignments, :note, :text
  end
end
