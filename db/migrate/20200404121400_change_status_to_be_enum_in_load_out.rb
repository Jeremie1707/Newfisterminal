class ChangeStatusToBeEnumInLoadOut < ActiveRecord::Migration[5.2]
  def change
    change_column :load_outs, :status, :integer, using: 'status::integer',:null => false, :default => 1
  end
end

