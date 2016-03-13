class Order < ActiveRecord::Base
  has_many :order_items, inverse_of: :order
  belongs_to :customer
  belongs_to :warehouse

    def customer_name
        if customer
            customer.name
        else
            ''
        end
    end

    def validate_order_is_complete
        unless order_type and order_type.present?
            errors.add(:order_type, 'is required')
        end

        unless created_at
            errors.add(:created_at, 'is required')
        end

        unless order_number && order_number.present?
            errors.add(:order_number, 'is required')
        end

        unless customer_id
            errors.add(:customer_id, 'is required');
        end

        unless warehouse_id
            errors.add(:warehouse_id, 'is required');
        end

        if order_items.empty?
            errors.add(:items, 'list is empty')
        end

        order_items.each do |item|
            unless item.item_id
                errors.add(item.barcode, "barcode #{ item.barcode } is an unknown item")
            end
        end
    end

    def unfilled_items
        []
    end

    def shipped_items
        []
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
