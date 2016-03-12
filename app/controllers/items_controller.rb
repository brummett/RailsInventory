class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to @item
        else
            render 'new'
        end
    end

    private def item_params
        params.require(:item).permit(:name, :sku, :barcode, :cost_cents, :price_cents, :description)
    end
end
