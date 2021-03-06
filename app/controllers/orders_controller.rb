class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new_receive
        @order = Order.create(order_type: 'receive')
        redirect_to edit_order_path(@order)
    end

    def new_sale
        @order = Order.create(order_type: 'sale')
        redirect_to edit_order_path(@order)
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])

        resolve_customer_id_from_name

        @order.update(order_params)

        @order.validate_order_is_complete
        if @order.errors.empty?
            @order.save
            redirect_to orders_path
        else
            render 'edit'
        end
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order
        else
            render 'new'
        end
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy

        redirect_to orders_path
    end

    def add_item
        @order = Order.find(params[:id])
        for i in @order.order_items
            if i.barcode == params[:barcode]
                order_item = i
            end
        end
        if order_item
            order_item.inc
        else
            item = Item.find_by(barcode: params[:barcode])
            if item
                order_item = @order.order_items.new(barcode: params[:barcode], item_id: item.id, count: 1)
            else
                order_item = @order.order_items.new(barcode: params[:barcode], count: 1)
            end
        end
        order_item.save
        redirect_to edit_order_path(@order)
    end

    private def resolve_customer_id_from_name
        unless params[:customer_name].blank?
            names = params[:customer_name].split(' ', 2)
            customer = Customer.find_by(first_name: names[0], last_name: names[1])
            @order.customer_id = customer.id if customer
        end
    end

    private def order_params
        params.require(:order).permit(:created_at, :order_number, :warehouse_id)
    end
end
