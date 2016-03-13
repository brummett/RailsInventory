class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new_receive
        @order = Order.new(order_type: 'receive')
        @order.save # need to save here so @order gets an ID - order_number, etc are as yet null
        redirect_to edit_order_path(@order)
    end

    def edit
        @order = Order.find(params[:id])
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

    private def order_params
        params.require(:order).permit(:order_number, :type)
    end
end
