class CreatePackers < ActiveRecord::Migration[5.2]
  def change
    create_table :packers do |t|
      t.string :packer_nr
      t.string :name

      t.timestamps
    end
  end
end
