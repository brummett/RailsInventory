class Item < ActiveRecord::Base
    validates :sku, presence: true,
                     length: { minimum: 1 },
                     uniqueness: { message: 'SKU must be unique' }
    validates :barcode, presence: true,
                     length: { minimum: 1 },
                     uniqueness: { message: 'barcode must be unique' }
end
