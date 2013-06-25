class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
