class AddNoteToInLoadIns < ActiveRecord::Migration[5.2]
  def change
    add_column :load_ins, :note, :text
  end
end
