class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :address
      t.string :phonenumber
      t.string :email
      t.string :notes

      t.timestamps null: false
    end
  end
end
