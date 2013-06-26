class AddIndexesOnAllTheStuff < ActiveRecord::Migration
  def change
    add_index :users, :id
    add_index :users, :name
    add_index :users, :room
    add_index :users, :visible
    add_index :users, :created_at
    
    add_index :products, :name
    add_index :products, :visible
    add_index :products, :created_at
    
    add_index :bills, :user_id
    add_index :bills, :product_id
    add_index :bills, :created_at
  end
end
