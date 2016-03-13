class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

    def barcode
        self.item.barcode if self.item
    end

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
