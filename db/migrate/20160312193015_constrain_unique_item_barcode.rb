class ConstrainUniqueItemBarcode < ActiveRecord::Migration
  def change
    add_index :items, :barcode, :unique => true
  end
end
