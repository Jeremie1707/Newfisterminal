class DropRecipientAdresses < ActiveRecord::Migration[5.2]
  def change
    drop_table :recipient_addresses
  end
end
