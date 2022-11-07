class OrderItemsController < ApplicationController
    def index
        @cart_items=current_user.cart.cart_items
        @order_items=@cart_items.all
    end 
    def copy
        @cart_items=current_user.cart.cart_items
        @cart_items.each do |a|
            @order_item=OrderItem.create(cart_item_id: a.id)
           if @order_item.save
            debugger
           end
        end
        redirect_to order_items_path
    end
    private
    def order_item_params
        params.require(:order_item).permit(:cart_item_id)
      end
end
