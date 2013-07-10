class AddWidthToProduct < ActiveRecord::Migration
  def change
    add_column :products, :width, :integer, default: 130
  end
end
