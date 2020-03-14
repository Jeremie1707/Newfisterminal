class AddTotalWeightToLoadOuts < ActiveRecord::Migration[5.2]
  def change
     add_column :load_outs, :total_weight, :integer
  end
end
