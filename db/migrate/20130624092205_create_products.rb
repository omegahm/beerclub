class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
