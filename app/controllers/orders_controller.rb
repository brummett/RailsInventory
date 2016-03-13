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

    private def order_params
        params.require(:order).permit(:order_number, :type)
    end
end
