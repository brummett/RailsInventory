class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
        @item.barcode ||= params[:barcode]
    end

    def edit
        @item = Item.find(params[:id])
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            if params[:order_id] && params[:order_id].length != 0
                # Created a previously-unknown item from a create-order form
                # update the order_item with the matching barcode to point to us
                puts "looking up order_item with order_id #{ params[:order_id] } barcode #{ @item.barcode }"
                order_item = OrderItem.find_by(order_id: params[:order_id], barcode: @item.barcode)
                order_item.update(item_id: @item.id)
                redirect_to edit_order_path order_item.order
            else
                redirect_to items_path
            end
        else
            render 'new'
        end
    end

    def update
        @item = Item.find(params[:id])

        if @item.update(item_params)
            redirect_to items_path
        else
            render 'edit'
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy

        redirect_to items_path
    end

    private def item_params
        params.require(:item).permit(:name, :sku, :barcode, :cost_cents, :price_cents, :description)
    end
end
