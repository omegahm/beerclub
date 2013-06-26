class AddTempIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :temp_id, :integer
  end
end
