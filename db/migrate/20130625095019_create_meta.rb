class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
      t.float :cash
      t.float :loss
      t.float :stock

      t.timestamps
    end
  end
end
