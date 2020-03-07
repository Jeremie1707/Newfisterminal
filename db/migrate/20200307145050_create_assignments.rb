class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :in_assignment, foreign_key: true
      t.references :out_assignment, foreign_key: true

      t.timestamps
    end
  end
end
