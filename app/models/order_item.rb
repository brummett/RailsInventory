class OrderItem < ActiveRecord::Base
  validates :barcode, presence: true,
                      length: { minimum: 1 }
  belongs_to :order, inverse_of: :order_items
  belongs_to :item

    def sku
        self.item.sku if self.item
    end

    def name
        self.item.name if self.item
    end

    def inc
        self.update(count: self.count + 1)
    end

    def dec
        self.update(count: self.count - 1)
    end
end
