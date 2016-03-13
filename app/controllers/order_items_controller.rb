class OrderItemsController < ApplicationController
    validates :count, presence: true
end
