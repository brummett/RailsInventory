class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :customer
  belongs_to :warehouse

    def customer_name
        if @customer
            @customer.name
        else
            ''
        end
    end

    # make these view partials
    def order_form_customer_label
        if @order_type == 'receive'
            'Shipped from vendor'
        else
            'Customer'
        end
    end

    def order_form_warehouse_label
        if @order_type == 'receive'
            'Received to'
        else
            'Shipped from'
        end
    end

    def order_form_item_cost_label
        if @order_type == 'receive'
            'Unit cost cents'
        else
            'Price each cents'
        end
    end
end
