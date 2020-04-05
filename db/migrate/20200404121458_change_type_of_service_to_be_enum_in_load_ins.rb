class ChangeTypeOfServiceToBeEnumInLoadIns < ActiveRecord::Migration[5.2]
  def change
    change_column :load_ins, :type_of_service, :integer, using: 'status::integer'
  end
end
