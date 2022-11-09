class OrdersController < ApplicationController
    def new 
        @order=Order.new
        @cart_items=current_user.cart.cart_items
    end
end
