class DropPackerAdresses < ActiveRecord::Migration[5.2]
  def change
    drop_table :packer_addresses
  end
end
