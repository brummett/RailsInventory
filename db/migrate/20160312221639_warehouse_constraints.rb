class WarehouseConstraints < ActiveRecord::Migration
  def change
    change_column_null :warehouses, :name, true
    add_index :warehouses, :name, :unique => true
  end
end
