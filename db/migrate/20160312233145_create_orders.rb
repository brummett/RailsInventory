class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :order_type
      t.references :customer, index: true, foreign_key: true
      t.references :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
