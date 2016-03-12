class ItemsController < ApplicationController
    def show
        @item = Item.find(params[:id])
    end

    def new
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to @item
    end

    private def item_params
        params.require(:item).permit(:name, :sku, :barcode, :cost_cents, :price_cents, :description)
    end
end
