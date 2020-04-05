class ChangeStatusToBeEnumInLoadIn < ActiveRecord::Migration[5.2]
  def change
     change_column :load_ins, :status, :integer, using: 'status::integer'
  end
end
