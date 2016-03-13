class OrderItemsController < ApplicationController
    validates :count, presence: true
    validates :barcode, presence: true
end
