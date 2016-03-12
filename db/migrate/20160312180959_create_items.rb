class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :sku
      t.string :barcode
      t.integer :cost_cents
      t.integer :price_cents
      t.string :description

      t.timestamps null: false
    end
  end
end
