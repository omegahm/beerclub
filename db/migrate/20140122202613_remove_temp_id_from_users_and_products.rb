class RemoveTempIdFromUsersAndProducts < ActiveRecord::Migration
  def up
    remove_column :users, :temp_id
    remove_column :products, :temp_id
  end

  def down
    add_column :users, :temp_id, :integer
    add_column :products, :temp_id, :integer
  end
end
