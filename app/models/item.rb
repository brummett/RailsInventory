class Item < ActiveRecord::Base
    validates :sku, presence: true,
                     length: { minimum: 1 },
                     uniqueness: { message: 'SKU must be unique' }
end
