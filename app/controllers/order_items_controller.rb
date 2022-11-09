class OrderItemsController < ApplicationController
    def index
        @cart_items=current_user.cart.cart_items
        @order_items=@cart_items.all
    end 
    private
    def order_item_params
        params.require(:order_item).permit(:cart_item_id)
      end
end
