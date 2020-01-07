class AddNoteToLoadOuts < ActiveRecord::Migration[5.2]
  def change
    add_column :load_outs, :note, :text
  end
end
