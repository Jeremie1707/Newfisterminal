class ChangeStatusToBeEnumInLoadOut < ActiveRecord::Migration[5.2]
  def change
    change_column :load_outs, :status, :integer, using: 'status::integer'
  end
end

